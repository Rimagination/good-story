param(
  [string]$Root = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = 'Stop'

function Fail {
  param([string]$Message)
  throw $Message
}

$ledgerPath = Join-Path $Root 'evals\mature-evidence-2026-06-02.md'
if (-not (Test-Path -LiteralPath $ledgerPath)) {
  Fail "Missing mature evidence ledger: $ledgerPath"
}

$text = Get-Content -LiteralPath $ledgerPath -Encoding utf8 -Raw
$rows = [regex]::Matches($text, '(?m)^\| (S|R|E)\d+ \| .+ \| .+ \| .+ \| Pass \| .+ \|$')
$caseCount = $rows.Count

$fields = New-Object System.Collections.Generic.HashSet[string]
$externalCount = 0
foreach ($row in $rows) {
  $parts = $row.Value.Trim('|').Split('|') | ForEach-Object { $_.Trim() }
  $field = ($parts[1] -split '/')[0].Trim()
  [void]$fields.Add($field)
  $origin = $parts[3]
  if ($origin -match 'External user|External reviewer') {
    $externalCount++
  }
}

Write-Output "Passed cases: $caseCount"
Write-Output "Distinct fields: $($fields.Count)"
Write-Output "External user/reviewer cases: $externalCount"

if ($caseCount -lt 15) {
  Fail "Mature gate failed: expected at least 15 passed cases, found $caseCount."
}

if ($fields.Count -lt 5) {
  Fail "Mature gate failed: expected at least 5 fields, found $($fields.Count)."
}

if ($externalCount -lt 3) {
  Fail "Mature gate failed: expected at least 3 external user/reviewer cases, found $externalCount."
}

Write-Output 'Mature evidence gate passed.'
