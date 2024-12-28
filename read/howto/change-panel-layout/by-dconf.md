---
title: 更改「Mate Panel」的「Layout」/ By dconf
nav_order: 7010
has_children: false
parent: 更改「Mate Panel」的「Layout」
grand_parent: 如何
---


# 更改「Mate Panel」的「Layout」/ By dconf




## 主題

* [其他方式](#其他方式)
* [範例腳本](#範例腳本)
* [Mate Panel Layouts](#mate-panel-layouts)
* [Change Layout / By dconf](#by-dconf)
* [dconf db Backup and Restore](#dconf-db-backup-and-restore)
* [Debian Package](#debian-package)
* [Manpage](#manpage)
* [Help](#help)




## 其他方式

| 其他方式 |
| ------- |
| [By mate-panel](by-mate-panel) |
| [By mate-tweak](by-mate-tweak) |




## 範例腳本

> [範例腳本](https://github.com/samwhelp/note-about-mate/blob/gh-pages/_demo/sample/mate-panel/change-layout/prototype/by-dconf/)




## Mate Panel Layouts

| Mate Panel 內建的 Layout |
| ------------------ |
| [/usr/share/mate-panel/layouts](https://github.com/mate-desktop/mate-panel/tree/master/data) |


| 我個人撰寫的 Mate Panel Layout |
| ------------------ |
| [/usr/share/mate-panel/layouts](https://github.com/samwhelp/note-about-mate/tree/gh-pages/_demo/sample/mate-panel/layouts/mate-panel-layouts/asset/overlay/usr/share/mate-panel/layouts) |

執行

``` sh
ls /usr/share/mate-panel/layouts/*.layout | awk -F '/' '{printf $6"\n"}' | awk -F '.layout' '{printf $1"\n"}'
```

顯示

```
brisk-menu-stand-alone-bottom
brisk-menu-stand-alone-top
classic-menu-stand-alone-bottom
classic-menu-stand-alone-top
default
fedora
linuxmint
mageia
mate-menu-stand-alone-bottom
mate-menu-stand-alone-top
opensuse
stand-alone-bottom
stand-alone-top
ubuntu
```




## By dconf


### set

> 主要採用「`dconf`」這個方式

> [範例腳本](https://github.com/samwhelp/note-about-mate/blob/gh-pages/_demo/sample/mate-panel/change-layout/prototype/by-dconf/prototype.sh)


> 舉例：執行下面指令，將「Mate Panel Layout」改成「`default`」。

``` sh
dconf reset -f /org/mate/panel/

dconf write /org/mate/panel/general/default-layout "'default'"

mate-panel --replace &
```


> 舉例：執行下面指令，將「Mate Panel Layout」改成「`brisk-menu-stand-alone-top`」。

``` sh
dconf reset -f /org/mate/panel/

dconf write /org/mate/panel/general/default-layout "'brisk-menu-stand-alone-top'"

mate-panel --replace &
```


### get

> 執行下面指令，了解目前設定的「Mate Panel Layout」。

``` sh
dconf read /org/mate/panel/general/default-layout
```

顯示

```
'brisk-menu-stand-alone-top'
```


### dump

> 執行下面指令，了解目前的「Mate Panel 設定」。

``` sh
dconf dump /org/mate/panel/
```

> 顯示如下，可以對照「[/usr/share/mate-panel/layouts/brisk-menu-stand-alone-top.layout](https://github.com/samwhelp/note-about-mate/blob/gh-pages/_demo/sample/mate-panel/layouts/mate-panel-layouts/asset/overlay/usr/share/mate-panel/layouts/brisk-menu-stand-alone-top.layout)」。

```
[general]
default-layout='brisk-menu-stand-alone-top'
object-id-list=['main-menu', 'file-manager', 'text-editor', 'web-brower', 'terminal', 'control-center', 'show-desktop', 'window-list', 'workspace-switcher', 'notification-area', 'clock']
toplevel-id-list=['main-panel']

[objects/clock]
applet-iid='ClockAppletFactory::ClockApplet'
locked=true
object-type='applet'
panel-right-stick=true
position=0
relative-to-edge='end'
toplevel-id='main-panel'

[objects/clock/prefs]
custom-format=''
format='24-hour'

[objects/control-center]
launcher-location='/usr/share/applications/matecc.desktop'
locked=true
object-type='launcher'
position=15
toplevel-id='main-panel'

[objects/file-manager]
launcher-location='/usr/share/applications/pcmanfm-qt.desktop'
locked=true
object-type='launcher'
position=11
toplevel-id='main-panel'

[objects/main-menu]
applet-iid='BriskMenuFactory::BriskMenu'
locked=true
object-type='applet'
position=0
toplevel-id='main-panel'

[objects/notification-area]
applet-iid='NotificationAreaAppletFactory::NotificationArea'
locked=true
object-type='applet'
panel-right-stick=true
position=10
relative-to-edge='end'
toplevel-id='main-panel'

[objects/show-desktop]
applet-iid='WnckletFactory::ShowDesktopApplet'
locked=true
object-type='applet'
position=16
toplevel-id='main-panel'

[objects/terminal]
launcher-location='/usr/share/applications/sakura.desktop'
locked=true
object-type='launcher'
position=14
toplevel-id='main-panel'

[objects/text-editor]
launcher-location='/usr/share/applications/org.xfce.mousepad.desktop'
locked=true
object-type='launcher'
position=12
toplevel-id='main-panel'

[objects/web-brower]
launcher-location='/usr/share/applications/firefox-esr.desktop'
locked=true
object-type='launcher'
position=13
toplevel-id='main-panel'

[objects/window-list]
applet-iid='WnckletFactory::WindowListApplet'
locked=true
object-type='applet'
position=20
toplevel-id='main-panel'

[objects/workspace-switcher]
applet-iid='WnckletFactory::WorkspaceSwitcherApplet'
locked=true
object-type='applet'
panel-right-stick=true
position=20
relative-to-edge='end'
toplevel-id='main-panel'

[toplevels/main-panel]
expand=true
orientation='top'
screen=0
size=24

```

> 上面的內容，可以對照「[/usr/share/mate-panel/layouts/brisk-menu-stand-alone-top.layout](https://github.com/samwhelp/note-about-mate/blob/gh-pages/_demo/sample/mate-panel/layouts/mate-panel-layouts/asset/overlay/usr/share/mate-panel/layouts/brisk-menu-stand-alone-top.layout)」來觀看，執行下面指令

``` sh
cat /usr/share/mate-panel/layouts/brisk-menu-stand-alone-top.layout
```

顯示

```
[Toplevel main-panel]
expand=true
orientation=top
size=24




[Object main-menu]
object-type=applet
applet-iid=BriskMenuFactory::BriskMenu
toplevel-id=main-panel
position=0
locked=true




[Object file-manager]
object-type=launcher
launcher-location=/usr/share/applications/pcmanfm-qt.desktop
toplevel-id=main-panel
position=11
locked=true


[Object text-editor]
object-type=launcher
launcher-location=/usr/share/applications/org.xfce.mousepad.desktop
toplevel-id=main-panel
position=12
locked=true


[Object web-brower]
object-type=launcher
launcher-location=/usr/share/applications/firefox-esr.desktop
toplevel-id=main-panel
position=13
locked=true


[Object terminal]
object-type=launcher
launcher-location=/usr/share/applications/sakura.desktop
toplevel-id=main-panel
position=14
locked=true


[Object control-center]
object-type=launcher
launcher-location=/usr/share/applications/matecc.desktop
toplevel-id=main-panel
position=15
locked=true


[Object show-desktop]
object-type=applet
applet-iid=WnckletFactory::ShowDesktopApplet
toplevel-id=main-panel
position=16
locked=true




[Object window-list]
object-type=applet
applet-iid=WnckletFactory::WindowListApplet
toplevel-id=main-panel
position=20
locked=true




[Object workspace-switcher]
object-type=applet
applet-iid=WnckletFactory::WorkspaceSwitcherApplet
toplevel-id=main-panel
position=20
panel-right-stick=true
locked=true


[Object notification-area]
object-type=applet
applet-iid=NotificationAreaAppletFactory::NotificationArea
toplevel-id=main-panel
position=10
panel-right-stick=true
locked=true


[Object clock]
object-type=applet
applet-iid=ClockAppletFactory::ClockApplet
toplevel-id=main-panel
position=0
panel-right-stick=true
locked=true
```



## dconf db Backup and Restore

> 執行下面[指令](https://github.com/samwhelp/note-about-mate/blob/gh-pages/_demo/sample/mate-panel/change-layout/prototype/by-dconf-load/layout-brisk-menu-stand-alone-top/config-dump.sh)，將「設定」儲存到「[mate-panel-layout.conf](https://github.com/samwhelp/note-about-mate/blob/gh-pages/_demo/sample/mate-panel/change-layout/prototype/by-dconf-load/layout-brisk-menu-stand-alone-top/mate-panel-layout.conf)」這個檔案。

``` sh
dconf dump /org/mate/panel/ > mate-panel-layout.conf
```


> 執行下面[指令](https://github.com/samwhelp/note-about-mate/blob/gh-pages/_demo/sample/mate-panel/change-layout/prototype/by-dconf-load/layout-brisk-menu-stand-alone-top/config-load.sh)，將「[mate-panel-layout.conf](https://github.com/samwhelp/note-about-mate/blob/gh-pages/_demo/sample/mate-panel/change-layout/prototype/by-dconf-load/layout-brisk-menu-stand-alone-top/mate-panel-layout.conf)」載入到「dconf db」。

``` sh
dconf load /org/mate/panel/ < mate-panel-layout.conf
```




## Debian Package

| Debian Package |
| -------------- |
| [dconf-cli](https://packages.debian.org/stable/dconf-cli) |
| [mate-panel](https://packages.debian.org/stable/mate-panel) |
| [mate-tweak](https://packages.debian.org/stable/mate-tweak) |


| Debian Package |
| -------------- |
| [mate-applets](https://packages.debian.org/stable/mate-applets) |
| [mate-applet-brisk-menu](https://packages.debian.org/stable/mate-applet-brisk-menu) |
| [mate-applet-appmenu](https://packages.debian.org/stable/mate-applet-appmenu) |
| [mate-dock-applet](https://packages.debian.org/stable/mate-dock-applet) |




## Manpage

* [man dconf](https://manpages.debian.org/stable/dconf-cli/dconf.1.en.html)
* [man mate-panel](https://manpages.debian.org/stable/mate-panel/mate-panel.1.en.html)
* [man mate-tweak](https://manpages.debian.org/stable/mate-tweak/mate-tweak.1.en.html)




## Help

執行

``` sh
dconf help
```

顯示

```
Usage:
  dconf COMMAND [ARGS...]

Commands:
  help              Show this information
  read              Read the value of a key
  list              List the contents of a dir
  write             Change the value of a key
  reset             Reset the value of a key or dir
  compile           Compile a binary database from keyfiles
  update            Update the system databases
  watch             Watch a path for changes
  dump              Dump an entire subpath to stdout
  load              Populate a subpath from stdin

Use 'dconf help COMMAND' to get detailed help.

```


執行

``` sh
mate-panel --help
```

顯示

```
Usage:
  mate-panel [OPTION…]

Help Options:
  -h, --help                      Show help options
  --help-all                      Show all help options
  --help-sm-client                Show session management options
  --help-gtk                      Show GTK+ Options

Application Options:
  --replace                       Replace a currently running panel
  --reset                         Reset the panel configuration to default
  --run-dialog                    Execute the run dialog
  --layout                        Set the default panel layout
  --display=DISPLAY               X display to use

```


執行

``` sh
mate-tweak --help
```

顯示

```
usage: mate-tweak [-h] [--layout LAYOUT] [--get-layout]

options:
  -h, --help       show this help message and exit
  --layout LAYOUT  Switch to a panel layout
  --get-layout     Get the current panel layout
```
