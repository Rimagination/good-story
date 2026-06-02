param(
  [string]$Root = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = 'Stop'

function Assert-True {
  param(
    [bool]$Condition,
    [string]$Message
  )
  if (-not $Condition) {
    throw $Message
  }
}

function Assert-File {
  param([string]$RelativePath)
  $path = Join-Path $Root $RelativePath
  Assert-True -Condition (Test-Path $path) -Message "Missing file: $RelativePath"
}

function Assert-Contains {
  param(
    [string]$RelativePath,
    [string]$Pattern
  )
  $path = Join-Path $Root $RelativePath
  Assert-True -Condition (Select-String -Path $path -Pattern $Pattern -Quiet) -Message "Missing pattern '$Pattern' in $RelativePath"
}

function Find-LineIndex {
  param(
    [string[]]$Lines,
    [string]$Prefix
  )
  for ($i = 0; $i -lt $Lines.Count; $i++) {
    if ($Lines[$i].StartsWith($Prefix)) {
      return $i
    }
  }
  return -1
}

function Resolve-DocRelativePath {
  param(
    [string]$BaseDirectory,
    [string]$Target
  )
  $pathPart = ($Target -split '#', 2)[0].Trim()
  if ([string]::IsNullOrWhiteSpace($pathPart)) {
    return $null
  }
  if ($pathPart.StartsWith('<') -and $pathPart.EndsWith('>')) {
    $pathPart = $pathPart.Substring(1, $pathPart.Length - 2)
  }
  $pathPart = [uri]::UnescapeDataString($pathPart)
  return Join-Path $BaseDirectory $pathPart
}

function Assert-MarkdownLinks {
  param([System.IO.FileInfo[]]$Files)

  foreach ($file in $Files) {
    $text = Get-Content -LiteralPath $file.FullName -Encoding utf8 -Raw
    $matches = [regex]::Matches($text, '\[[^\]]+\]\(([^)]+)\)')
    foreach ($match in $matches) {
      $target = $match.Groups[1].Value.Trim()
      if ($target -match '^(https?:|mailto:|#)') {
        continue
      }
      $resolved = Resolve-DocRelativePath -BaseDirectory $file.DirectoryName -Target $target
      if ($null -eq $resolved) {
        continue
      }
      Assert-True -Condition (Test-Path -LiteralPath $resolved) -Message "Broken local markdown link in $($file.FullName): $target"
    }
  }
}

function Assert-ReadmeAssets {
  param([string]$ReadmePath)

  $readmeDirectory = Split-Path -Parent $ReadmePath
  $text = Get-Content -LiteralPath $ReadmePath -Encoding utf8 -Raw
  $matches = [regex]::Matches($text, '\s(?:src|srcset)="([^"]+)"')
  foreach ($match in $matches) {
    $rawValue = $match.Groups[1].Value
    if ($rawValue -match '^https?:') {
      continue
    }
    $candidates = $rawValue -split ',' | ForEach-Object {
      ($_.Trim() -split '\s+')[0]
    }
    foreach ($candidate in $candidates) {
      if ([string]::IsNullOrWhiteSpace($candidate) -or $candidate -match '^https?:') {
        continue
      }
      $resolved = Join-Path $readmeDirectory ([uri]::UnescapeDataString($candidate))
      Assert-True -Condition (Test-Path -LiteralPath $resolved) -Message "Broken README asset reference: $candidate"
    }
  }
}

Write-Output 'Checking required product files...'
@(
  '.gitattributes',
  '.gitignore',
  'README.md',
  'SKILL.md',
  'RELEASE.md',
  'CONTRIBUTING.md',
  'CHANGELOG.md',
  'agents\openai.yaml',
  'examples\README.md',
  'examples\before-after.md',
  'examples\field-mini-cases.md',
  'templates\README.md',
  'templates\story-diagnosis.md',
  'templates\abstract-rewrite.md',
  'templates\figure-order.md',
  'templates\field-calibration.md',
  'templates\rebuttal-prep.md',
  'docs\FAQ.md',
  'docs\OUTPUT_SPEC.md',
  'docs\ROADMAP.md',
  'evals\README.md',
  'evals\fresh-session-runbook.md',
  'evals\scenarios.md',
  'evals\real-material-smoke-tests.md',
  'evals\baseline-2026-06-02.md',
  'evals\fresh-session-run-2026-06-02.md',
  'evals\maturity-audit-2026-06-02.md',
  'evals\mature-evidence-2026-06-02.md',
  'evals\external-feedback-template.md',
  'scripts\validate-product.ps1',
  'scripts\validate-mature.ps1'
) | ForEach-Object { Assert-File -RelativePath $_ }

Write-Output 'Checking README product entry points...'
@(
  'examples/before-after.md',
  'examples/field-mini-cases.md',
  'templates/README.md',
  'docs/FAQ.md',
  'docs/OUTPUT_SPEC.md',
  'docs/ROADMAP.md',
  'evals/fresh-session-runbook.md',
  'evals/scenarios.md',
  'evals/real-material-smoke-tests.md',
  'evals/baseline-2026-06-02.md',
  'evals/fresh-session-run-2026-06-02.md',
  'evals/maturity-audit-2026-06-02.md',
  'evals/mature-evidence-2026-06-02.md',
  'scripts/validate-product.ps1',
  'scripts/validate-mature.ps1',
  'RELEASE.md',
  'CONTRIBUTING.md',
  'CHANGELOG.md',
  '### Start Here',
  '### See Examples',
  '### Quality Checks',
  '### Release Checklist',
  '## References /'
) | ForEach-Object { Assert-Contains -RelativePath 'README.md' -Pattern $_ }

Write-Output 'Checking skill on-demand loading...'
@(
  'examples/before-after.md',
  'examples/field-mini-cases.md',
  'references/cross-domain-transfer.md',
  'references/overclaim-calibration.md',
  'Source Depth Rule'
) | ForEach-Object { Assert-Contains -RelativePath 'SKILL.md' -Pattern $_ }

Write-Output 'Checking evaluation coverage...'
$scenariosPath = Join-Path $Root 'evals\scenarios.md'
$scenariosText = Get-Content -Path $scenariosPath -Encoding utf8 -Raw
$scenarioCount = [regex]::Matches($scenariosText, '(?m)^## Scenario \d+:').Count
Assert-True -Condition ($scenarioCount -eq 9) -Message "Expected 9 evaluation scenarios, found $scenarioCount"
Assert-Contains -RelativePath 'evals\scenarios.md' -Pattern 'Source Depth'

$realMaterialPath = Join-Path $Root 'evals\real-material-smoke-tests.md'
$realMaterialText = Get-Content -Path $realMaterialPath -Encoding utf8 -Raw
$fullTextBasisCount = [regex]::Matches($realMaterialText, '(?m)^### Full-Text Basis$').Count
Assert-True -Condition ($fullTextBasisCount -eq 6) -Message "Expected 6 Full-Text Basis notes, found $fullTextBasisCount"
Assert-Contains -RelativePath 'evals\real-material-smoke-tests.md' -Pattern 'abstract-only'

Write-Output 'Checking release checklist...'
@(
  'evals/scenarios.md',
  'evals/real-material-smoke-tests.md',
  'evals/fresh-session-runbook.md',
  'evals/baseline-2026-06-02.md',
  'evals/fresh-session-run-2026-06-02.md',
  'evals/maturity-audit-2026-06-02.md',
  'evals/mature-evidence-2026-06-02.md',
  'validate-product.ps1',
  'validate-mature.ps1',
  'Release candidate',
  'Mature',
  'templates/README.md',
  'docs/FAQ.md',
  'docs/OUTPUT_SPEC.md',
  'docs/ROADMAP.md'
) | ForEach-Object { Assert-Contains -RelativePath 'RELEASE.md' -Pattern $_ }

Write-Output 'Checking publication support files...'
Assert-Contains -RelativePath '.gitattributes' -Pattern '\*\.png binary'
Assert-Contains -RelativePath '.gitattributes' -Pattern '\*\.webp binary'
Assert-Contains -RelativePath 'agents\openai.yaml' -Pattern 'display_name: "Good Story"'

Write-Output 'Checking references...'
$readme = Join-Path $Root 'README.md'
$text = Get-Content -Path $readme -Encoding utf8 -Raw
$refHeader = '## References /'
$refIndex = $text.IndexOf($refHeader)
Assert-True -Condition ($refIndex -ge 0) -Message 'README missing References heading'
$beforeRefs = $text.Substring(0, $refIndex)

$lines = Get-Content -Path $readme -Encoding utf8
$refStart = Find-LineIndex -Lines $lines -Prefix $refHeader
Assert-True -Condition ($refStart -ge 0) -Message 'README missing References heading line'
$refs = $lines[($refStart + 1)..($lines.Count - 1)] | Where-Object { $_ -match '^\d+\. ' }
Assert-True -Condition ($refs.Count -eq 23) -Message "Expected 23 numbered references, found $($refs.Count)"
for ($i = 1; $i -le 23; $i++) {
  Assert-True -Condition (($refs | Where-Object { $_ -match "^$i\. " }).Count -eq 1) -Message "Missing or duplicate reference $i"
}

$used = [regex]::Matches($beforeRefs, '\[(\d+)\]') | ForEach-Object { [int]$_.Groups[1].Value } | Sort-Object -Unique
$defined = 1..23
$missingDefs = $used | Where-Object { $_ -notin $defined }
$unusedDefs = $defined | Where-Object { $_ -notin $used }
Assert-True -Condition (-not $missingDefs) -Message ('Citation without definition: ' + ($missingDefs -join ', '))
Assert-True -Condition (-not $unusedDefs) -Message ('Defined reference not cited before References: ' + ($unusedDefs -join ', '))

Write-Output 'Checking user-facing copy for obvious untranslated labels...'
$englishStart = Find-LineIndex -Lines $lines -Prefix '## English'
Assert-True -Condition ($englishStart -gt 0) -Message 'Cannot locate English section'
$earlyReadme = $lines[0..([Math]::Min($englishStart - 1, 180))] -join "`n"
$badTerms = @('figure order', 'benchmark gain', 'Good Story Card', 'claim:', 'overclaim')
$hits = $badTerms | Where-Object { $earlyReadme -match [regex]::Escape($_) }
Assert-True -Condition (-not $hits) -Message ('User-facing copy still has untranslated labels: ' + ($hits -join ', '))

Write-Output 'Checking Chinese terminology consistency...'
$bestStoryTerm = ([string][char]0x6700) + ([string][char]0x5f3a) + ([string][char]0x6545) + ([string][char]0x4e8b)
$storySpineTerm = ([string][char]0x6545) + ([string][char]0x4e8b) + ([string][char]0x4e3b) + ([string][char]0x7ebf)
Assert-Contains -RelativePath 'references\terminology-style.md' -Pattern ('Best story \| ' + [regex]::Escape($bestStoryTerm))
Assert-Contains -RelativePath 'references\terminology-style.md' -Pattern ('Story spine \| ' + [regex]::Escape($storySpineTerm))
Assert-Contains -RelativePath 'docs\OUTPUT_SPEC.md' -Pattern ('## ' + [regex]::Escape($bestStoryTerm))
Assert-Contains -RelativePath 'docs\OUTPUT_SPEC.md' -Pattern ('## ' + [regex]::Escape($storySpineTerm))

Write-Output 'Checking local markdown links and README assets...'
$markdownFiles = Get-ChildItem -Path $Root -Recurse -File -Include '*.md'
Assert-MarkdownLinks -Files $markdownFiles
Assert-ReadmeAssets -ReadmePath $readme

Write-Output 'Checking SKILL frontmatter size...'
$skill = Join-Path $Root 'SKILL.md'
$skillText = Get-Content -Path $skill -Encoding utf8 -Raw
$front = [regex]::Match($skillText, '(?s)^---\s*(.*?)\s*---').Groups[1].Value
Assert-True -Condition ($front.Length -le 1024) -Message "SKILL frontmatter exceeds 1024 chars: $($front.Length)"

Write-Output 'Checking trailing whitespace...'
foreach ($file in $markdownFiles) {
  $trailing = Select-String -Path $file.FullName -Pattern '[ \t]+$'
  Assert-True -Condition (-not $trailing) -Message "Trailing whitespace found in $($file.FullName)"
}

Write-Output 'Checking mojibake markers...'
$mojibakeMarkers = @(
  0x93b4, # common UTF-8-as-GBK mojibake marker
  0x9422,
  0x6d93,
  0x935a,
  0x7ed4,
  0x9225,
  0x922b,
  0x9241,
  0x9242,
  0x4fd9,
  0x8930,
  0x566f,
  0x9356,
  0xfffd
) | ForEach-Object { [regex]::Escape([string][char]$_) }
$mojibakePattern = $mojibakeMarkers -join '|'
foreach ($file in $markdownFiles) {
  $mojibake = Select-String -Path $file.FullName -Pattern $mojibakePattern
  Assert-True -Condition (-not $mojibake) -Message "Possible mojibake found in $($file.FullName)"
}

Write-Output 'All good-story product checks passed.'
