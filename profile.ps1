# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineOption -HistorySearchCursorMovesToEnd

# Kubectl Autocompletion
#Import-Module -Name PSKubectlCompletion
#Register-KubectlCompletion

function Restart-PowerShell
{
    if((Get-PSHostProcessInfo).ProcessName.Contains('powershell_ise'))
    {
        Start-Process 'powershell_ise.exe'
    } else {
        Start-Process 'powershell.exe'
    }
    exit
}

function Open-Admin-Powershell
{
    if((Get-PSHostProcessInfo).ProcessName.Contains('powershell_ise'))
    {
        Start-Process 'powershell_ise.exe' -Verb RunAs
    } else {
        Start-Process 'powershell.exe' -Verb RunAs
    }
}

function Refresh-Creds-Forced{
	aws-azure-login --mode gui --no-prompt --profile default
}

function Refresh-Java-8{
	setx -m JAVA_HOME "C:\Program Files\Java\jdk1.8.0_211"
	RefreshEnv.cmd
	admin
}

function Refresh-Java-11{
	setx -m JAVA_HOME "C:\Program Files\Java\jdk-11.0.14"
	RefreshEnv.cmd
	admin
}
function Refresh-Java-15{
	setx -m JAVA_HOME "C:\Program Files\Java\jdk-15.0.2"
	RefreshEnv.cmd
	admin
}

function Refresh-Creds-Last-Hope{
	$env:PUPPETEER_EXECUTABLE_PATH = 'C:\Program Files\Google\Chrome\Application\chrome.exe'
	aws-azure-login --mode gui --no-prompt --profile default
}

function Uat-Shortcut{
	ssh chnet-uat-bastion
}

# New-Alias <alias> <aliased-command>
New-Alias open ii
New-Alias restart Restart-PowerShell
New-Alias admin Open-Admin-Powershell
#New-Alias k kubectl
New-Alias rc C:\Users\f.michelini\.aws\refresh-creds.ps1
New-Alias rcf Refresh-Creds-Forced
New-Alias j-8 Refresh-Java-8
New-Alias j-11 Refresh-Java-11
New-Alias j-15 Refresh-Java-15
New-Alias rc-last-hope Refresh-Creds-Last-Hope
New-Alias queue "C:\Users\f.michelini\ChNet\Roaming\OCPP complete flow\automatic_start.bat"
New-Alias uat Uat-Shortcut
