function Get-Win32Info {
    param (
        $win32
    )

    foreach ($Win32 in $win32) {
        $Args = Get-Command -ParameterName $Win32 -ErrorAction SilentlyContinue
        Get-WmiObject -Query "select * from win32_operatingsystem" | Select-Object -Expand $Win32
    }
}
