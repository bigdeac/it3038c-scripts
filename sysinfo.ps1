function getIP{ 

    (get-netipaddress).ipv4address | Select-String "192*" 

} 

$IP = getIP
$User = $env:UserName
$Ver = $PSVersionTable.PSVersion.Major
$Host = $env:ComputerName
$Date = Get-Date -Format "dddd, MMMM dd, yyyy"

$BODY = "This machine's IP is $IP. User is $User. Hostname is $Host. PowerShell $Ver. Today's Date is $Date."

# Output $BODY to a file
$BODY | Out-File -FilePath "C:\Scripts\output.txt"
