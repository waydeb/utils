function Import-Scripts {

    param (
        [switch]$userinfo,
        [switch]$win32info,
        [switch]$sysinfo,
        [switch]$all
    )

    begin {
        if ($userinfo.IsPresent) {
            Copy-Item -Path $HOME\utils\sysinfo-powershell\scripts\user-info.ps1 -Destination $HOME\Documents\WindowsPowerShell\Modules
        }

        if ($win32info.IsPresent) {
            Copy-Item -Path $HOME\utils\sysinfo-powershell\scripts\win32-info.ps1 -Destination $HOME\Documents\WindowsPowerShell\Modules
        }

        if ($sysinfo.IsPresent) {
            Copy-Item -Path $HOME\utils\sysinfo-powershell\scripts\sys-info.ps1-Destination $HOME\Documents\WindowsPowerShell\Modules
        }

        if ($all.IsPresent) {
            Copy-Item -Path $HOME\utils\sysinfo-powershell\scripts\*.ps1 -Destination $HOME\Documents\WindowsPowerShell\Modules
        }
    }  
}