#!/bin/bash
InterfaceId=70000;
WoWAddonPath='/D/Spiele/Battle.net/World of Warcraft/Interface/AddOns';
addonList="Overachiever Overachiever_Tabs Overachiever_Trade";

for addon in $addonList
do
	echo $addon
	#remove folder if exists
	rm -rf "$addon"
	rm -rf "$WoWAddonPath/$addon"
	#create folder
	mkdir -p "$addon"
	mkdir -p "$WoWAddonPath/$addon"
	#copy files to folder
	cp -R "src/$addon" "."
	#replace %%%INTERFACEID%%% with the InterfaceId
	sed -i -e "s/%%%INTERFACEID%%%/$InterfaceId/g" "$addon/$addon.toc"
	#move everything to addon folder
	cp -R "$addon" "$WoWAddonPath/"
done