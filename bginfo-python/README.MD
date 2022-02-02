# Wayde's automated sysinfo wallpaper script

## Setup

Open `required\settings.json` and adjust the settings to your liking
Settings that can be changed are 

* `x_adjust`
* `y_adjust`
* `path_to_base`
* `path_to_final`
* `path_to_font`

You may also need to change `ip = socket.gethostbyname_ex(hs)[2][1]` for most people this will most likely be `ip = socket.gethostbyname_ex(hs)[0][1]` or `ip = socket.gethostbyname_ex(hs)[1][1]` however this depends on how many network interfaces your system has. 

Install 

* `pillow`
* `psutil`
* `system-info`

## Run

`python path\to\make.py`

## Automation on Windows login

You may also decide to automate this task on boot, if you wish to do so, I have provided a template task for Windows to do so. This will not work on your system by default so you will need to edit if it you choose to use the template.

## Anything else?

Feel free to email me at `wayde@alphaxdev.xyz` or open an issue!