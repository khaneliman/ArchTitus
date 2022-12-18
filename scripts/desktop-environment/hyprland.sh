#!/usr/bin/env bash

#github-action genshdoc
#
# @file Hyprland custom script
# @brief Contains the functions used to configure and theme Hyprland window manager
# @stdout Output routed to install.log
# @stderror Output routed to install.log

hypr_create_symlink() {
	ln -s ~/.local/share/wlroots-env/ /usr/local/share/
	ln -s ~/.local/bin/Hyprland-custom /usr/local/bin/
	ln -s ~/.local/bin/xdg-desktop-portal.sh /usr/local/bin/
}

hypr_enable_systemd_services() {
	systemctl --user enable --now hypr-waybar.service
	systemctl --user enable --now waybar-config.path
	systemctl --user enable --now hypr-swayidle.service
	systemctl --user enable --now hyprpaper.service
	systemctl --user enable --now hyprland-desktop-portal.service
}

hypr_copy_configuration() {
	cp -r ~/archinstaller/configs/hyprland/home/. ~

	sudo mkdir -p /usr/share/wayland-sessions/
	sudo cp ~/archinstaller/configs/hyprland/usr/share/wayland-sessions/hyprland-custom.desktop /usr/share/wayland-sessions/
}

hypr_copy_configuration
hypr_create_symlink
hypr_enable_systemd_services
