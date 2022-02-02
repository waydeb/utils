function Get-UserInfo {
    params (
        $acc
    )
    foreach ($Acc in $acc) {
        $Args = Get-Command -ParameterName $Acc -ErrorAction SilentlyContinue
        Get-WmiObject -Query "select * from Win32_UserAccount where Name='$env:USERNAME'" | Select-Object -Expand $Acc
    }
}
