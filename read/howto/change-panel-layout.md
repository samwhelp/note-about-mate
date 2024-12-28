---
title: 更改「Mate Panel」的「Layout」
nav_order: 7030
has_children: true
parent: 如何
---


# 更改「Mate Panel」的「Layout」

| 更改「Mate Panel」的「Layout」| 更多說明 |
| --------------------------- | ------- |
| [By dconf](#by-dconf) | [更多說明](change-panel-layout/by-dconf) |
| [By mate-panel](#by-mate-panel) | [更多說明](change-panel-layout/by-mate-panel) |
| [By mate-tweak](#by-mate-tweak) | [更多說明](change-panel-layout/by-mate-tweak) |




## 範例腳本

> [範例腳本](https://github.com/samwhelp/note-about-mate/tree/gh-pages/_demo/sample/mate-panel)




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

> [範例](https://github.com/samwhelp/note-about-mate/blob/gh-pages/_demo/sample/mate-panel/change-layout/prototype/by-dconf/prototype.sh)

``` sh
dconf reset -f /org/mate/panel/

dconf write /org/mate/panel/general/default-layout "'default'"

mate-panel --replace &
```


## By mate-panel

> [範例](https://github.com/samwhelp/note-about-mate/blob/gh-pages/_demo/sample/mate-panel/change-layout/prototype/by-mate-panel/prototype.sh)

> 本來預期採用下面三行的流程，不過不是每次都會成功。

``` sh
mate-panel --reset

mate-panel --layout 'default'

mate-panel --replace &
```

> 於是改為下面三行的流程，就可以正常運行

``` sh
mate-panel --reset

dconf write /org/mate/panel/general/default-layout "'default'"

mate-panel --replace &
```


## By mate-tweak

> [範例](https://github.com/samwhelp/note-about-mate/blob/gh-pages/_demo/sample/mate-panel/change-layout/prototype/by-mate-tweak/prototype.sh)

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


執行

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



執行

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




## Debian Package

| Debian Package |
| -------------- |
| [dconf-cli](https://packages.debian.org/stable/dconf-cli) |
| [mate-panel](https://packages.debian.org/stable/mate-panel) |
| [mate-tweak](https://packages.debian.org/stable/mate-tweak) |




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
