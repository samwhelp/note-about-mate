#!/usr/bin/env bash



##
## ## layout list
##

#ls /usr/share/mate-panel/layouts/*.layout | awk -F '/' '{printf $6"\n"}' | awk -F '.layout' '{printf $1"\n"}'



##
## ## clean old layout
##

#dconf reset -f /org/mate/panel/
mate-panel --reset




##
## ## set new layout
##

dconf write /org/mate/panel/general/default-layout "'default'"
#mate-panel --layout 'default'

dconf read /org/mate/panel/general/default-layout




##
## ## restart mate-panel
##

mate-panel --replace &
