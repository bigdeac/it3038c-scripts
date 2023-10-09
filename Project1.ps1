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
