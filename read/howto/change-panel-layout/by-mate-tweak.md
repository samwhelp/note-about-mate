---
title: 更改「Mate Panel」的「Layout」/ By by-mate-tweak
nav_order: 7030
has_children: false
parent: 更改「Mate Panel」的「Layout」
grand_parent: 如何
---


# 更改「Mate Panel」的「Layout」/ By by-mate-tweak




## 主題

* [其他方式](#其他方式)
* [範例腳本](#範例腳本)
* [Mate Panel Layouts](#mate-panel-layouts)
* [Change Layout / By mate-tweak](#by-mate-tweak)




## 其他方式

| 其他方式 |
| ------- |
| [By dconf](by-dconf) |
| [By mate-panel](by-mate-panel) |




## 範例腳本

> [範例腳本](https://github.com/samwhelp/note-about-mate/blob/gh-pages/_demo/sample/mate-panel/change-layout/prototype/by-mate-tweak/)




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




## By mate-tweak

> [範例腳本](https://github.com/samwhelp/note-about-mate/blob/gh-pages/_demo/sample/mate-panel/change-layout/prototype/by-mate-tweak/prototype.sh)

執行

``` sh
mate-tweak --get-layout
```

顯示

```
Window Manager is: marco
System installed layouts:
['fedora', 'default', 'opensuse']
Current layout: default
```


> 舉例：執行下面指令，將「Mate Panel Layout」改成「`default`」。

``` sh
mate-tweak --layout 'default'
```

顯示

```
Window Manager is: marco
System installed layouts:
['fedora', 'default', 'opensuse']
Current layout: default
Switching to: default
```


> 舉例：執行下面指令，將「Mate Panel Layout」改成「`brisk-menu-stand-alone-top`」。

``` sh
mate-tweak --layout 'brisk-menu-stand-alone-top'
```

顯示

```
Window Manager is: marco
System installed layouts:
['fedora', 'default', 'opensuse']
Current layout: default
Switching to: brisk-menu-stand-alone-top
Found dock hint for brisk-menu-stand-alone-top
```


> 注意事項: 我在「Debian Bookworm」執行「`mate-tweak --layout 'default'`」，發現會出錯，提示訊息如下

```
Window Manager is: marco
System installed layouts:
['fedora', 'default', 'opensuse']
Current layout: brisk-menu-stand-alone-bottom
Switching to: default
Traceback (most recent call last):
  File "/usr/bin/mate-tweak", line 1737, in <module>
    mt.replace_panel_layout(args.layout, True)
  File "/usr/bin/mate-tweak", line 768, in replace_panel_layout
    self.enable_applets()
  File "/usr/bin/mate-tweak", line 571, in enable_applets
    pid = subprocess.Popen(['mate-volume-control-applet'], stdout=DEVNULL, stderr=DEVNULL).pid
          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.11/subprocess.py", line 1024, in __init__
    self._execute_child(args, executable, preexec_fn, close_fds,
  File "/usr/lib/python3.11/subprocess.py", line 1901, in _execute_child
    raise child_exception_type(errno_num, err_msg, err_filename)
FileNotFoundError: [Errno 2] No such file or directory: 'mate-volume-control-applet'
```

> 於是修改「`/usr/bin/mate-tweak`」這個檔案，

> 找到其中一行「[pid = subprocess.Popen(['mate-volume-control-applet'], stdout=DEVNULL, stderr=DEVNULL).pid](https://github.com/ubuntu-mate/mate-tweak/blob/master/mate-tweak#L571)」

> 將「`mate-volume-control-applet`」改成「`mate-volume-control-status-icon`」，就可以正常運作。



