#!/usr/bin/env bash




## select layout

layout_name="brisk-menu-stand-alone-top"




##
## ## layout list
##

#ls /usr/share/mate-panel/layouts/*.layout | awk -F '/' '{printf $6"\n"}' | awk -F '.layout' '{printf $1"\n"}'



##
## ## clean old layout
##

dconf reset -f /org/mate/panel/




##
## ## set new layout
##

dconf write /org/mate/panel/general/default-layout "'${layout_name}'"

dconf read /org/mate/panel/general/default-layout




##
## ## restart mate-panel
##

mate-panel --replace &
