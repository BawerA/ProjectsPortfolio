#Below is how the user will input the full path of where they want to save all their files.
#Example: The user will input 'Example: C:\User\Documents\Folder' and all the files will save into that folder
#The If statement will check if the user correctly enter an path by checking for a specific string that all file paths will have
#If the string is not located then a warning message will input instead, the code will still run on the power shell terminal, but will not save it on the file path.

$Path = Read-Host "Please enter the file path where you want to save the data.`r`n Make sure you save it into an empty folder. `r`n'Example: C:\User\Documents\Folder'"

if ($Path.Contains(":\")) {
    Write-Host "We can now use this path to save our files!"
}
else {
    Write-Warning -Message "No path was entered or the input was not correct. Files will not be saved."
}

################################################################################

#This will display the current date and time for the computer with the function Get-Date. This will also add the time zone offset.
#GetTotalDateText is a variable that will save the path that the user enters and the script will create a text file that will save in that directory.
#The script will print it into a text file if a file path was correctly inputed and will print it onto the powershell terminal.

$GetStartDateText = "\getstartdate.txt"
$GetTotalStartDateText = $Path+$GetStartDateText

Write-Host "This is the current date and time for the system."
Get-Date -Format "dddd MM/dd/yyyy HH:mm K"  | Out-File -FilePath $GetTotalStartDateText
Get-Date -Format "dddd MM/dd/yyyy HH:mm K"

################################################################################

#This will display the system and operating system properties from the current system it is running with the Get-ComputerInfo Command
#GetTotalComputerInfo is a variable that will combine the users path and the excel extension at the end
#Format-Table will organize the output / Export-CSV will export to an excel file if the file path was correctly inputed.

$GetComputerInfoCsv = "\getcomputerinfo.csv"
$GetTotalComputerInfo = $Path+$GetComputerInfoCsv

Write-Host "`r`nBelow is the computer system and operating system properties for this computer!"
Get-ComputerInfo | Export-Csv -Path $GetTotalComputerInfo
#Get-ComputerInfo

################################################################################

#This will display all the active process on the system with the function Get-Process.
#GetTotalProcess is a variable that will combine the users path and the excel extension to create the file.
#Format-Table will organize the file better / Export-Csv will export it into an excel file for further inpection

$GetProcessCsv = "\getprocess.csv"
$GetTotalProcess = $Path+$GetProcessCsv

Write-Host "`r`nBelow is all the active processes running on this system."
Get-Process | Export-Csv -Path $GetTotalProcess
#Get-Process | Format-Table | Out-File -FilePath $GetTotalProcess
#Get-Process | Format-Table

################################################################################

#This will get all the servies that are running and stopping on the computer with the Get-Service command.
#GetTotalService is a variable that will combine the users path and the excel extension to create the file.
#Since there is a lot of information in Get-Service, we will export it into an excel file.

$GetServiceCsv = "\getservice.csv"
$GetTotalService = $Path+$GetServiceCsv

Write-Host "`r`nBelow is a list of all the services that behaves on this system."
Get-Service | Export-Csv -Path $GetTotalService 
#Get-Service

################################################################################

#This will get all the WMI classes and information on the computer with Get-WmiObject
#GetTotalWmiObject is a variable that will combine the users path and the excel extension to create the file.
#Format-Table will organize the file better / Export-Csv will export it into an excel file for further inpection
###
$GetWmiObjectCsv = "\getwmiobject.csv"
$GetTotalWmiObject = $Path+$GetWmiObjectCsv

Write-Host "`r`nBelow is a list of all the instances on WMI on this system."
Get-WmiObject -Class Win32_Process | Export-Csv -Path $GetTotalWmiObject
#Get-WmiObject -Class Win32_Process

################################################################################

#This will obtain the local DNS client cache from the current system with the Get-DnsClientCache Command
#GetTotalDnsClientCache is a variable that will combine the users path and the text file extension to create the file.
#Format-Table will organize the file better / Export-Csv will export it into a text file for further inpection

$GetDnsClientCacheTxt = "\getdnsclientcache.csv"
$GetTotalDnsClientCache = $Path+$GetDnsClientCacheTxt

Write-Host "`r`nBelow is the DNS client cache for the computer.."
Get-DnsClientCache | Export-Csv -Path $GetTotalDnsClientCache
#Get-DnsClientCache

################################################################################

#This will get all the current TCP connections in the system. Will obtain local and remote IP Address with the Get-NetTCPConnection command
#GetTotalNetTCPConnection is a variable that will combine the users path and the excel extension to create the file.
#Format-Table will organize the file better / Export-Csv will export it into an excel file for further inpection

$GetNetTCPConnectionCsv = "\getnettcpconnection.csv"
$GetTotalNetTCPConnection = $Path+$GetNetTCPConnectionCsv

Write-Host "`r`nBelow is a the TCP Connections for the current system."
Get-NetTCPConnection | Export-Csv -Path $GetTotalNetTCPConnection
#Get-NetTCPConnection

################################################################################

#This will get the neighbor cache entries fro the computer system. Information includes IP Address and ARP Cache with the Get-NetNeighbor command
#GetTotalNetNeighbor is a variable that will combine the users path and the excel extension to create the file.
#Format-Table will organize the file better / Export-Csv will export it into an excel file for further inpection

$GetNetNeighborCsv = "\getnetneighbor.csv"
$GetTotalNetNeighbor = $Path+$GetNetNeighborCsv

Write-Host "`r`nBelow is the Neightbor cache entries for the system."
Get-NetNeighbor | Export-Csv -Path $GetTotalNetNeighbor
#Get-NetNeighbor

################################################################################

#This will obtain the IP Address configuration for the system. IPV4, IPv6. This will also format it in table form with the Get-IPAddress command
#GetTotalNetIPAddress is a variable that will combine the users path and the text file extension to create the file.
#Format-Table will organize the file better / Export-Csv will export it into a text file for further inpection

$GetNetIPAddressTxt = "\getnetipaddress.txt"
$GetTotalNetIPAddress = $Path+$GetNetIPAddressTxt

Write-Host "`r`nBelow is the IP Address Configuration for the current system."
Get-NetIPAddress | Format-Table | Out-File -FilePath $GetTotalNetIPAddress
#Get-NetIPAddress | Format-Table

################################################################################

#This will obtain the basic network adapter properties of the system with the Get-NetAdapter command.
#GetTotalNetAdapter is a variable that will combine the users path and the text file extension to create the file.
#Format-Table will organize the file better / Export-Csv will export it into a text file for further inpection

$GetNetAdapterCsv = "\getnetadapter.csv"
$GetTotalNetAdapter = $Path+$GetNetAdapterCsv

Write-Host "`r`nBelow is the network adapters for the current system."
Get-NetAdapter | Export-Csv -Path $GetTotalNetAdapter
#Get-NetAdapter | Format-Table

################################################################################

#This will obtain the event logs from the local computer with the Get-EventLog Command
#GetTotalEventLog is a variable that will combine the users path and the text file extension to create the file.
#Get-EventLog System, Application, and Security will the specific events for each of them.
#Format-Table will organize the file better / Export-Csv will export it into a text file for further inpection

$GetEventLogListTxt = "\geteventloglist.txt"
$GetTotalEventLogList = $Path+$GetEventLogListTxt

Write-Host "`r`nBelow are the event logs for the current system."
Get-EventLog -List | Out-File -FilePath $GetTotalEventLogList
#Get-EventLog -List

$GetEventLogSystemCsv = "\geteventlogsystem.csv"
$GetTotalEventLogSystem = $Path+$GetEventLogSystemCsv

Get-EventLog System -Newest 500 | Export-Csv -Path $GetTotalEventLogSystem
#Get-EventLog System -Newest 500

$GetEventLogSecurityCsv = "\geteventlogsecurity.csv"
$GetTotalEventLogSecurity = $Path+$GetEventLogSecurityCsv

Get-EventLog Security -Newest 500 | Export-Csv -Path $GetTotalEventLogSecurity
#Get-EventLog Security -Newest 500

$GetEventLogApplicationCsv = "\geteventlogapplication.csv"
$GetTotalEventLogApplication = $Path+$GetEventLogApplicationCsv

Get-EventLog Application -Newest 500 | Export-Csv -Path $GetTotalEventLogApplication
#Get-EventLog Application -Newest 500

################################################################################

#This will obtain all the hotfixes that are installed on this local computer with the Get-HotFix Command
#GetTotalHotFix is a variable that will combine the users path and the text file extension to create the file.
#Format-Table will organize the file better / Export-Csv will export it into a text file for further inpection

$GetHotFixCsv = "\gethotfix.csv"
$GetTotalHotFix = $Path+$GetHotFixCsv

Write-Host "`r`nBelow are all the current hot-fixes on this computer."
Get-HotFix | Export-Csv -Path $GetTotalHotFix
#Get-HotFix | Format-Table

################################################################################

#This will give all the information about what drives are in the current session of this system.

$GetPSDriveCsv = "\getpsdrive.csv"
$GetTotalPSDrive = $Path+$GetPSDriveCsv

Write-Host "`r`nBelow are all the current hot-fixes on this computer."
Get-PSDrive | Export-Csv -Path $GetTotalPSDrive
#Get-PSDrive

################################################################################

#Below is where the script will create an excel file with all the file hashes of the files that were created.
#The hashes will be in MD5

$GetHash = "\hashfiles.csv"
$GetPath = "\*.*"
$GetTotalPath = $Path+$GetPath
$GetTotalHash = $Path+$GetHash

Get-FileHash -Algorithm SHA256 -Path (Get-ChildItem $GetTotalPath -Recurse) | Export-Csv -Path $GetTotalHash

################################################################################

#This will display the current date and time for the computer with the function Get-Date. This will also add the time zone offset.
#GetTotalEndDateText is a variable that will show the time of when the script is completed.
#The script will print it into a text file if a file path was correctly inputed and will print it onto the powershell terminal.

$GetEndDateText = "\getenddate.txt"
$GetTotalEndDateText = $Path+$GetEndDateText

Write-Host "This is the current date and time for the system."
Get-Date -Format "dddd MM/dd/yyyy HH:mm K"  | Out-File -FilePath $GetTotalEndDateText
Get-Date -Format "dddd MM/dd/yyyy HH:mm K"


################################################################################