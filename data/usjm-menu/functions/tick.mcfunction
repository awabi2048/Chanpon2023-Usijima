## Tick
execute as @a[tag=Usjm.Player.Shop] at @s run function usjm-menu:shop/tick


execute as @a[tag=Usjm.Player.Shop] unless entity @s[tag=Usjm.Menu] run tag @s remove Usjm.Player.Shop


execute as @a if score @s Usjm.Menu.CloseDetectTimer matches 1.. run scoreboard players remove @s Usjm.Menu.CloseDetectTimer 1

execute as @a[tag=Usjm.Player.Menu-Opened] at @s if score @s Usjm.Menu.CloseDetectTimer matches 1 run function usjm-menu:start_detection
execute as @a[tag=Usjm.Player.Menu-Opened] at @s if score @s Usjm.Menu.CloseDetectTimer matches 0 anchored eyes positioned ^ ^ ^32 unless entity @e[tag=Usjm.Menu-Marker,distance=..0.01] run function usjm-menu:closed

execute at @a as @e[tag=Usjm.Menu,distance=..8] at @s positioned ~ ~-1.65 ~ unless score @s Usjm.Link = @p[tag=Usjm.Player] Usjm.Link run kill @s
