---
title: 停用按鍵綁定「Super_L」開啟「Menu」
nav_order: 7022
has_children: false
parent: 如何
---


# 停用按鍵綁定「Super_L」開啟「Menu」


## 設定指令

我採用的是「brisk-menu」，

執行下面指令，停用按鍵綁定「Super_L」開啟「Menu」

``` sh
gsettings set com.solus-project.brisk-menu hot-key ''
```


## 恢復指令

若要恢復原本的設定，則是可以執行下面的指令

``` sh
gsettings reset com.solus-project.brisk-menu hot-key
```

或是執行下面的指令，恢復原本的設定

``` sh
gsettings set com.solus-project.brisk-menu hot-key 'Super_L'
```

執行下面的指令，則是觀看目前的設定值

``` sh
gsettings get com.solus-project.brisk-menu hot-key
```

顯示

```
'Super_L'
```


## 相關議題

| 相關議題 |
| ------- |
| [設定 Mouse Button Modifier](https://samwhelp.github.io/note-about-mate/read/howto/config-mouse-button-modifier.html) |


## gschema

| gschema |
| ------- |
| /usr/share/glib-2.0/schemas/com.solus-project.brisk-menu.gschema.xml |


執行下面指令

``` sh
grep 'hot-key' /usr/share/glib-2.0/schemas/com.solus-project.brisk-menu.gschema.xml -A 4
```

顯示

``` xml
    <key type="s" name="hot-key">
      <default>'Super_L'</default>
      <summary>Keyboard shortcut</summary>
      <description>Accelerator key for opening and closing the menu.</description>
    </key>
```
