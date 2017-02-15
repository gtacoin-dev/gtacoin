
Debian
====================
This directory contains files used to package gtacoind/gtacoin-qt
for Debian-based Linux systems. If you compile gtacoind/gtacoin-qt yourself, there are some useful files here.

## gtacoin: URI support ##


gtacoin-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install gtacoin-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your gtacoin-qt binary to `/usr/bin`
and the `../../share/pixmaps/gtacoin128.png` to `/usr/share/pixmaps`

gtacoin-qt.protocol (KDE)

