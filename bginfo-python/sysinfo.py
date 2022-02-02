import platform as p
import sys as s
import psutil as ps
import datetime as d
from system_info import sysinfo as sysi
import socket as sk

sys_info = sysi.sysInfo


class Info:

    async def hostname():
        return sk.gethostname()

    async def version():
        arch      = p.architecture()[0]
        sys_name  = p.system()
        sys_ver   = p.release()
        sku       = p.win32_edition()
        build     = s.getwindowsversion().build
        if build >= 22000:
            sys_ver = "11"
        if sku == "Core":
            sku = "Home"
        return f"{sys_name} {sys_ver} {sku} {build} {arch}"

    async def specs():
        ct = ps.cpu_count()
        c  = ps.cpu_count(logical=False)
        return f"{c} cores, {ct} threads"

    async def disk():
        d = ps.disk_usage('/')
        return f"{d.used/1024/1024/1024:.2f}GB used of {d.total/1024/1024/1024:.2f}GB"

    async def network():
        hs = sk.gethostname()
        ip = sk.gethostbyname_ex(hs)[3][1]
        return ip

    async def boot():
        return d.datetime.fromtimestamp(ps.boot_time()).strftime("%Y-%m-%d %H:%M:%S")

    async def oem():
        sys_oem = sys_info['Manufacturer']
        model   = sys_info['Model']
        return f"{sys_oem} {model}"
    
    async def ram():
        ram_size = sys_info['Ram_Size']
        ram_gen  = sys_info['Ram_Type']
        return f"{ram_size} {ram_gen}"