function Get-SystemInfo {
    param (
        $win32,
        $sys,
        $acc
    )

    foreach ($Win32 in $win32) {
        $Args = Get-Command -ParameterName $Win32 -ErrorAction SilentlyContinue
        Get-WmiObject -Query "select * from win32_operatingsystem" | Select-Object -Expand $Win32
    }

    foreach ($Acc in $acc) {
        $Args = Get-Command -ParameterName $Acc -ErrorAction SilentlyContinue
        Get-WmiObject -Query "select * from Win32_UserAccount where Name='$env:USERNAME'" | Select-Object -Expand $Acc
    }

    foreach ($Sys in $sys) {
        $Args = Get-Command -ParameterName $sys -ErrorAction SilentlyContinue
        Get-WmiObject -Query "select * from Win32_ComputerSystem" | Select-Object -Expand $Sys
    }
}