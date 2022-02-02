from sysinfo import Info as si
import asyncio
import ctypes as c
import json as j
from PIL import Image, ImageDraw, ImageFont

with open("C:\\auto_scripts\\wallpaper\\required\\settings.json") as f:
    settings  = j.load(f)
    x_adjust  = settings["image_settings"]["x_adjust"]
    y_adjust  = settings["image_settings"]["y_adjust"]
    base      = settings["paths"]["path_to_base"]
    wallpaper = settings["paths"]["path_to_final"]
    text_font = settings["paths"]["path_to_font"]

im = Image.open(base)
width, height = im.size
draw = ImageDraw.Draw(im)


async def main():
    print("Starting wallpaper script")
    full = f"""
Hostname: {await si.hostname()}
OEM & Model: {await si.oem()}
Version: {await si.version()}
CPU: {await si.specs()}
RAM: {await si.ram()}
Disk: {await si.disk()}
Network: {await si.network()}
Boot Time: {await si.boot()}
"""
    print(full+'\nSystem Info at login time')
    print(f"Starting wallpaper creation\nSource image: {base}")
    font = ImageFont.truetype(text_font, 20)
    textwidth, textheight = draw.textsize(full, font)
    margin = 10
    x = width - textwidth - margin - x_adjust
    y = height - textheight - margin - y_adjust
    draw.text((x,y), full, font=font)
    im.save(wallpaper)
    print(f"Wallpaper saved, waiting 3 seconds before applying\nFile location: {wallpaper}")
    await asyncio.sleep(3)
    c.windll.user32.SystemParametersInfoW(20, 0, wallpaper, 3)
    print("Wallpaper applied")


asyncio.run(main())