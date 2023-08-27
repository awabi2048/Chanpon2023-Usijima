## 閉じたよ
execute as @e[tag=Usjm.Menu-Marker] if score @s Usjm.Link = @p Usjm.Link run kill @s
execute as @e[tag=Usjm.Menu] if score @s Usjm.Link = @p Usjm.Link run kill @s

tag @s remove Usjm.Player.Menu-Opened
say close
