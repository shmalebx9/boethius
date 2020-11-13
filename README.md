# Boethius Utilities

Boethius is a small set of bash utilities I use to get a few features generally included in full desktop environments. These scripts allow one to easily swith wifi-networks, mount drives and open files without the overhead of more feature-rich programs built in with popular DEs. 
## Wifi switcher
Simply drop the script in your path or run it manually to select your wifi network with rofi. This script is built for wpa_supplicant as there are already many dmenu/rofi wifi handlers for NetworkManager and others.

## Opener
The script will open the file provided as an argument with the program defined in 'opener_definitions.' If no program is specified in the definitions file, the script will query the user for the correct program and add it to the definitions file. Default programs can be specified for mimetypes or file extensions.

To use the opener script just clone the repo and run the setup script.

## Mounter 
The mounter script detects when usb devices or SDcards are inserted into the machine and mounts any fat partition(s) on the device. The script is meant to run as a daemon and requires superuser permissions to mount filesystems. The mounter script outputs information when a device is inserted, mounted, unmounted, and removed. By default, output is written to `tmp/mounter-info`. The output is written to a file rather than a FIFO to allow multiple process to read and close the file.  Runit allows bash scripts to be run easily by adding the script to a service directory and enabling it by symlinking it to an active service directory. The directories differ by distribution. 

The proccess for enabling the mounter script in Void is as follows:

	mkdir -p /etc/sv/mounter
	cp scripts/mounter /etc/sv/mounter/run
	chmod +x /etc/sv/mounter/run
	ln -s /etc/sv/mounter /var/service/

To unmount/remount send a string with m/u and the device number to /tmp/mounter-receive. Example:

	echo 'u 12' > /tmp/mounter-receive
	echo 'm 12' > /tmp/mounter-receive
	
The mounter script will sync before unmounting to prevent data corruption.