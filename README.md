The five binary files below are missing in this package:

cast_shell, 
net_mgr:
These two files need to be hex-edited to modify URLs. 
The original is available on the system image and diffs of the hexdumps are provided.

rcast/rcast_media_player:
rcast/dns/dnsServer:
rcast/sntp/sntp_server:
The source and build instructions for these three files is distributed separately.


HOWTO create a rCast ROM from a Eureka ROM:
1: Unsquash system.img at ../system
2: Fix the five files mentioned above.
3: Run apply_mods.sh
4: Make SquashFS from system folder
5: Make eureka_image.zip
