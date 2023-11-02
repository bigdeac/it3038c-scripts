#Powershell Get all drives
$drives = Get-WmiObject Win32_LogicalDisk

#Initialize counters
$driveCount = 0
$totalFreeSpace = 0

#Loop through each drive
foreach ($drive in $drives) {
    #Check if drive is ready and not a CD-ROM
    if ($drive.DriveType -eq 3) {
        $driveCount++
        $totalFreeSpace += $drive.FreeSpace
    }
}

#Output the results
Write-Host "Number of drives: $driveCount"
Write-Host "Total free space across all drives: $($totalFreeSpace / 1GB) GB"

#Project 2 
# Loop through each drive again
foreach ($drive in $drives) {
    # Check if drive is ready and not a CD-ROM
    if ($drive.DriveType -eq 3) {
        $driveLetter = $drive.DeviceID
        $largestDir = ""
        $largestSize = 0

        # Get all directories in the drive
        $dirs = Get-ChildItem -Path $driveLetter\ -Directory

        # Loop through directories and find the largest one
        foreach ($dir in $dirs) {
            $dirSize = (Get-ChildItem -Path $dir.FullName -Recurse | Measure-Object -Property Length -Sum).Sum
            if ($dirSize -gt $largestSize) {
                $largestSize = $dirSize
                $largestDir = $dir.FullName
            }
        }

        # Output the largest directory for this drive
        Write-Host "Drive $driveLetter - Largest Directory: $largestDir, Size: $($largestSize / 1GB) GB"
    }
}
