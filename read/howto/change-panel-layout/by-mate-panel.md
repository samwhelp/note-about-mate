---
title: 更改「Mate Panel」的「Layout」/ By mate-panel
nav_order: 7020
has_children: false
parent: 更改「Mate Panel」的「Layout」
grand_parent: 如何
---


# 更改「Mate Panel」的「Layout」/ By mate-panel




## 主題

* [其他方式](#其他方式)
* [範例腳本](#範例腳本)
* [Mate Panel Layouts](#mate-panel-layouts)
* [Change Layout / By mate-panel](#by-mate-panel)
* [Debian Package](#debian-package)
* [Manpage](#manpage)
* [Help](#help)




## 其他方式

| 其他方式 |
| ------- |
| [By dconf](by-dconf) |
| [By mate-tweak](by-mate-tweak) |




## 範例腳本

> [範例腳本](https://github.com/samwhelp/note-about-mate/blob/gh-pages/_demo/sample/mate-panel/change-layout/prototype/mate-panel/)




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




## By mate-panel

> [範例腳本](https://github.com/samwhelp/note-about-mate/blob/gh-pages/_demo/sample/mate-panel/change-layout/prototype/by-mate-panel/prototype.sh)


> 本來預期採用下面三行的流程，不過不是每次都會成功。

``` sh
mate-panel --reset

mate-panel --layout 'default'

mate-panel --replace &
```

> 於是改為下面三行的流程，就可以正常運行


> 舉例：執行下面指令，將「Mate Panel Layout」改成「`default`」。

``` sh
mate-panel --reset

dconf write /org/mate/panel/general/default-layout "'default'"

mate-panel --replace &
```


> 舉例：執行下面指令，將「Mate Panel Layout」改成「`brisk-menu-stand-alone-top`」。

``` sh
mate-panel --reset

dconf write /org/mate/panel/general/default-layout "'brisk-menu-stand-alone-top'"

mate-panel --replace &
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
