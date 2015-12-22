#!/bin/bash

# Run this script from mods directory.
# It assumes the system.img has been unsquashed at ../system

# Patched files from Eureka-ROM
cp -v cast_shell ../system/chrome/cast_shell
cp -v net_mgr ../system/bin/net_mgr

# rCast additions
cp -rv rcast/ ../system/
cp -rv www/ ../system/usr/share/
