# Define the folder where the images are located and the output file
$imagesFolder = ".\"  # Change this to the path of your image folder
$outputFile = ".\imageList.txt"  # Change this to the path where you want to save the imageList.txt

# Get the current directory (to generate relative paths)
$rootFolder = (Get-Location).Path

# Get all image files in the folder (including subfolders up to 2 levels deep)
# The -Recurse parameter will search all subfolders and the -Depth 2 limits the search depth to two folder levels
$imageFiles = Get-ChildItem -Path $imagesFolder -Include *.jpg, *.jpeg, *.png, *.gif -Recurse -Depth 2

# Initialize an empty array to store relative paths
$relativePaths = @()

# Loop through each image file
foreach ($file in $imageFiles) {
    # Get the relative path by removing the root folder part from the full path
    $relativePath = $file.FullName.Replace($rootFolder + "\", "")
    
    # Append the relative path to the array
    $relativePaths += $relativePath
}

# Write the relative paths to the output file
$relativePaths | Out-File -FilePath $outputFile -Encoding UTF8

# Print a success message
Write-Host "Image list generated successfully at $outputFile"
