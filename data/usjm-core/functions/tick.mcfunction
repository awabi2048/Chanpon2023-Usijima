## Tick

function usjm-mobs:tick
function usjm-player_stats:tick
function usjm-combat:tick
function usjm-menu:tick
function usjm-items:tick
function usjm-npc:tick

# 例外
execute as @a[tag=Usjm.Player] at @s if entity @e[tag=Usjm.IgnoreInteraction,distance=..5] anchored eyes run function usjm-core:click_detection/raycast_exception

#> 各種クリック検知
# 左右クリック検知
execute as @a[tag=Usjm.Player] at @s unless entity @s[tag=Usjm.Player.BypassInteraction] anchored eyes positioned ^ ^ ^ unless entity @e[tag=Usjm.Interaction,distance=0,scores={Usjm.InteractionTimer=2..}] run function usjm-core:click_detection/summon_interaction

execute at @a[tag=Usjm.Player] as @e[tag=Usjm.Interaction,distance=..64] if score @s Usjm.Link = @p Usjm.UUID run scoreboard players remove @s Usjm.InteractionTimer 1 
execute at @a[tag=Usjm.Player] as @e[tag=Usjm.Interaction,distance=..64] if score @s Usjm.Link = @p Usjm.UUID if score @s Usjm.InteractionTimer matches ..0 run kill @s

# Qキー押下検知
execute as @a[tag=Usjm.Player] if score @s Usjm.DropKey matches 1.. at @s run function usjm-core:click_detection/q

#> メニュ－
execute as @a[tag=Usjm.Player.Menu] unless entity @s[tag=Usjm.Player.Menu-Opened] at @s anchored eyes run function usjm-menu:summon

tag @a[tag=Usjm.Player.BypassInteraction] remove Usjm.Player.BypassInteraction
tag @a[tag=Usjm.Player.Menu] remove Usjm.Player.Menu

# F検知
execute as @a[tag=Usjm.Player] if data entity @s Inventory[{Slot:-106b}] at @s run function usjm-core:click_detection/f

# シフト長押し
execute as @a if score @s Usjm.Sneaking matches 1.. run function usjm-core:detection/sneaking

#> UUID紐づけ
execute as @a[tag=Usjm.Player] unless score @s Usjm.UUID matches -2147483648..2147483647 store result score @s Usjm.UUID run data get entity @s UUID[0]

