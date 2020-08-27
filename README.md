# Boethius Utilities

Boethius is a small set of bash utilities I use to get a few features generally included in full desktop environments. These scripts allow one to easily swith wifi-networks, mount drives and open files without the overhead of more feature-rich programs built in with popular DEs. 
## Wifi switcher
Simply drop the script in your path or run it manually to select your wifi network with rofi. This script is built for wpa_supplicant as there are already many dmenu/rofi wifi handlers for NetworkManager and others.

## Opener
This script must be run from the same directory as the 'opener\_definitions' file. The script will open the file provided as an argument with the program defined in 'opener_definitions.' If no program is specified in the definitions file, the script will query the user for the correct program and add it to the definitions file. In order to query the user, the script prompts on the running terminal, so the script will not work if invoked from a gui program on an undefined filetype. Default programs can be specified for mimetypes or file extensions.

## Mounter 
The mounter script detects when usb devices or SDcards are inserted into the machine and mounts any fat partition(s) on the device. The script is meant to run as a daemon and requires superuser permissions to mount filesystems. Runit allows bash scripts to be run easily by adding the script to a service directory and enabling it by symlinking it to an active service directory. The directories differ by distribution. 

The proccess for enabling the mounter script in Void is as follows:

	mkdir -p /etc/sv/mounter
	cp scripts/mounter /etc/sv/mounter/run
	chmod +x /etc/sv/mounter/run
	ln -s /etc/sv/mounter /var/service/

