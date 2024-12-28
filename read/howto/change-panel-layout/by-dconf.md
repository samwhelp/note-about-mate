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

> 主要採用這個方式

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
