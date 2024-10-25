# Set the path to the folder
$folderPath = "C:\Users\chamb\OneDrive\Documents\mullet2024\projections\captchap5js\Emo-grey-224x224\surprise"

# Get all files in the folder, sort by LastWriteTime in descending order
$files = Get-ChildItem -Path $folderPath | Sort-Object LastWriteTime -Descending

# Keep the first 50 files and remove the rest
$filesToDelete = $files | Select-Object -Skip 50

# Delete the files
foreach ($file in $filesToDelete) {
    Remove-Item -Path $file.FullName -Force
    Write-Output "Deleted: $($file.FullName)"
}