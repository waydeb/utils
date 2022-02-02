function Get-SysInfo {
    params (
        $sys
    )
    foreach ($Sys in $sys) {
        $Args = Get-Command -ParameterName $sys -ErrorAction SilentlyContinue
        Get-WmiObject -Query "select * from Win32_ComputerSystem" | Select-Object -Expand $Sys
    }
}
