rCast ROM - Chromecast standalone media player

This is a custom ROM (based on Eureka mod version 27946.002) that will let 
you play local media files without any wifi or other devices to control it.
It essentially becomes a self contained media player.
Media files can be stored either locally on the internal flash, or from an 
attached USB memory.
Playback is controlled by the button on the device.

More info is available at xda-developers:
http://forum.xda-developers.com/hardware-hacking/chromecast/rom-rcast-chromecast-standalone-media-t3218203

The five binary files below are missing from these sources, and they need to 
be built and added manually.

*cast_shell*, 
*net_mgr*:
These two files need to be hex-edited to modify URLs. 
The original is available on the Eureka ROM system image and diffs of the 
hexdumps are provided.

*rcast/rcast_media_player*,
*rcast/dns/dnsServer*,
*rcast/sntp/sntp_server*:
The source and build instructions for these three files is distributed separately.


HOWTO create a rCast ROM from a Eureka ROM:
1: Unsquash system.img at ../system
2: Fix/add the five files mentioned above.
3: Run apply_mods.sh
   Make sure all changed files have the same uid and rights as in the original ROM.
   Most importantly check this for cast_shell.
4: Make SquashFS from system folder
5: Make eureka_image.zip

Your zip file is now ready to be flashed to your chromecast.
