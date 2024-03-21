# Homegear CUL as a Hassio add-on

This is a add-on to install and use [homgear](https://homegear.eu/) on Hassio. 
It's based on https://github.com/kreativmonkey/hassio-addons/tree/master/homegear.
In contrast to the ancestor project it limits to the usage of a CUL USB stick to communicate with Homematic devices using the homematicbidcos plugin.

Technically it's based on a Ubuntu 20.04 base image from homeassistant.
The reason for using an old base image is that the latest release artifacts from homegear is based on this version.
Homegear itself seems to be an abandoned project, however I do still use couple of old Homematic devices.
The base image leverages [s6](https://github.com/just-containers/s6-overlay).
Homegear is started therefore as a s6 service, see [](rootfs/etc/services.d/homegear/) for run and finish scripts.

## Installation

Follow these steps to get the add-on installed on your system:

1. Navigate in your Home Assistant frontend to Hass.io -> Add-On Store
2. Add the repository as [described here](https://home-assistant.io/hassio/installing_third_party_addons/)
3. Find and install "Homegear CUL" add-on

Don't get nervous after you've hit **Install**. Depending on your hardware and network, it may take up to half an hour before Homegear is installed. Once it appears in the list of installed add-ons, you'll have to **open** and **start** it. I wan't to improve the installation speed soon.

## How it works

A folder named `homegear/` will be added to the `/config` directory of your Home Assistant installation. `/config` is where all your other Home Assistant config files live as well. 
You can [access it via Samba](https://home-assistant.io/addons/samba/) for example. 
`/config/homegear` contains the homegear databasee files.
**It is advisable to perform backups of this folder!**


## Limitations

Works for me™, but your mileage may vary. I've tested with a [Home Assistant Blue](https://www.home-assistant.io/blue/) and a [CUL USB Stick](https://shop.busware.de/product_info.php/products_id/29).

# Contribution

You are welcome to open new issues for feature requests ore problems. Also pull requests are *very* welcome, especially to make this add-on work on other platforms.

## Debug

```
docker exec -it <mycontainer> bash
```
