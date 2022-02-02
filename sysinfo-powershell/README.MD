# **Wayde's Info Powershell Scripts**

 1. `user-info.ps1` - `Get-UserInfo -acc {list,of,things,to,call,for}`
 2. `win32-info.ps1` - `Get-Win32Info -win32 {list,of,things,to,call,for}`
 3. `sys-info.ps1` - `Get-Sysinfo -sys {list,of,things,to,call,for}`
__________
You can use the `Import-Scripts.ps1` file to import
```
. .\Import-Scripts.ps1
Import-Scripts {-userinfo|-win32info|-sysinfo|-all}
```
__________
Get-UserInfo - [Microsoft - User Accounts](https://docs.microsoft.com/en-us/windows/win32/cimwin32prov/win32-useraccount)

Get-Win32Info - [Microsoft - Operating System](https://docs.microsoft.com/en-us/windows/win32/cimwin32prov/win32-operatingsystem)

Get-SysInfo - [Microsoft - Computer System](https://docs.microsoft.com/en-us/windows/win32/cimwin32prov/win32-computersystem)
__________

**Anything else?**
Feel free to email me at `wayde@alphaxdev.xyz` or open an issue!
