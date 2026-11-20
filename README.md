# tvctrl

CLI remote control and diagnostic script for rooted LG webOS TVs using `luna-send` and `/bin/sh`. Includes an `install.sh` script that automates setup and installation.

> **⚠️ WARNING (rootmy.tv):** NEVER EVER OVERWRITE SYSTEM PARTITIONS LIKE KERNEL, ROOTFS, TVSERVICE.
> Your TV will be bricked, guaranteed! See https://rootmy.tv/warning for more info.

## Compatibility & Tested Environment

This script was written specifically for and tested on the following TV model, software version, and root method:

- **TV Model:** LG `32LQ620BPSB`
- **OS Version:** LG webOS TV `5.4`
- **Firmware Version:** `03.33.85`
- **SDK Version:** `7.3.1`
- **Root Method:** `dejavuln-autoroot` ([https://github.com/throwaway96/dejavuln-autoroot](https://github.com/throwaway96/dejavuln-autoroot))

*(Other webOS models or versions may have different `luna-send` service endpoints, app IDs, or `/dev/input/event*` mappings and may require adjustments.)*

## Requirements

- Rooted LG webOS TV (e.g., via `dejavuln-autoroot`) with SSH access
- `luna-send` available in the TV shell
- POSIX `/bin/sh` (compatible with BusyBox / standard webOS shell)

## Installation & Running from Any Directory

1. Clone the repository directly into `/home/root/Apps`, create the screenshot directory, and run `install.sh` to install `tvctrl`:

```sh
git clone [https://github.com/arm-ARMY/tvctrl.git](https://github.com/arm-ARMY/tvctrl.git) /home/root/Apps
mkdir -p /home/root/Apps/ScreenCap
chmod +x /home/root/Apps/tvctrl /home/root/Apps/install.sh
/home/root/Apps/install.sh
```

*(If `install.sh` does not configure your `PATH` automatically—or if you prefer to set it manually—add your script directory to `/home/root/.profile` so `tvctrl` can be run from any folder:)*

```sh
echo 'export PATH="$PATH:/directory_where_script_is_saved"' >> /home/root/.profile
. /home/root/.profile
```

*(Replace `/directory_where_script_is_saved` with the actual folder path where `tvctrl` is stored, e.g., `/home/root/Apps`.)*

## Usage

Run the interactive menu from any directory:

```sh
tvctrl
```

Or run commands directly via CLI arguments:

```sh
tvctrl vol
tvctrl yt [URL]
tvctrl tv
tvctrl on
tvctrl off
tvctrl bl
tvctrl scc
tvctrl msg
tvctrl pu
tvctrl browser [URL]
tvctrl input
tvctrl cpanel
tvctrl lgchan
tvctrl hdmi1
tvctrl hdmi2
tvctrl media
tvctrl saver
tvctrl keys
tvctrl ir
tvctrl translate
tvctrl apps
tvctrl fg
tvctrl bg
```

## Features

- **Gather Information:** Volume and mute status, picture settings inspection (`Backlight`, `Brightness`, `Contrast`, `Color`, `Sharpness`, `Picture Mode`), system and webOS info, installed/foreground/background apps, raw IR hex capture (`/dev/input/event1`), and real-time IR key translation.
- **Send Remote Commands:** Volume and mute control, picture adjustments, ad-free YouTube launch with return to previous app, screen power on/off, temporary brightness/backlight/contrast boost during screenshots (`ScreenCap`), modal alerts and toast pop-ups, web browser launcher, input/source switching, screen saver toggle, and real-time keyboard shortcuts.

## Disclaimer

This script interacts directly with internal webOS services via `luna-send` on rooted devices. Use at your own risk. Never overwrite system partitions (`KERNEL`, `ROOTFS`, `TVSERVICE`).

## License

This project is licensed under the [MIT License](LICENSE).
