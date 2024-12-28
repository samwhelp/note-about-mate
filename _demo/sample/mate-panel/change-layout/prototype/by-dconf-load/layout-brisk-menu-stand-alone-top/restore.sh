#!/usr/bin/env bash




dconf reset -f /org/mate/panel/

sleep 3

dconf load /org/mate/panel/ < mate-panel-layout.conf

sleep 3

mate-panel --replace &
