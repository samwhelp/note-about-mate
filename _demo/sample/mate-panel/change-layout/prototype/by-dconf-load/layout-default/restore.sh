#!/usr/bin/env bash




dconf reset -f /org/mate/panel/


dconf load /org/mate/panel/ < mate-panel-layout.conf


mate-panel --replace &
