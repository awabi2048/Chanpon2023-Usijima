## Tick 
#> クロスボウ着弾判定
# 地面に着弾時
execute at @a as @e[tag=Usjm.Misc.PlayerArrow,distance=..64] if data entity @s {inGround:true} at @s run kill @e[tag=Usjm.Misc.ArrowMarker,sort=nearest,limit=1]

# モブに着弾時
execute at @a as @e[tag=Usjm.Misc.ArrowMarker,distance=..64] run tag @s add Usjm.Misc.PlayerArrow-Hit
execute at @a as @e[tag=Usjm.Misc.ArrowMarker,distance=..64] on vehicle on passengers run tag @s remove Usjm.Misc.PlayerArrow-Hit

execute at @a as @e[tag=Usjm.Misc.PlayerArrow-Hit,distance=..64] at @s run function usjm-items:crossbow/on_hit


