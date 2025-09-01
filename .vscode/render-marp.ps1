# Render Marp slides to HTML and PDF
# Run this from the workspace root (the VS Code task sets cwd to ${workspaceFolder})

Write-Host "Installing Marp CLI..."
npm install @marp-team/marp-cli --no-save

Write-Host "Ensuring presentations/out directory exists..."
if (!(Test-Path -Path ".\presentations\out")) {
  New-Item -ItemType Directory -Path ".\presentations\out" | Out-Null
}

Write-Host "Rendering markdown files in presentations/ ..."
Get-ChildItem -Path "presentations" -Filter "*.md" -File | ForEach-Object {
  $in = $_.FullName
  $base = $_.BaseName
  Write-Host "Rendering $($_.Name) -> presentations/out/$base.html and presentations/out/$base.pdf"
  npx @marp-team/marp-cli $in -o ("presentations/out/$base.html") --allow-local-files
  npx @marp-team/marp-cli $in -o ("presentations/out/$base.pdf") --allow-local-files
}

Write-Host "Done. Outputs are in .\presentations\out"
