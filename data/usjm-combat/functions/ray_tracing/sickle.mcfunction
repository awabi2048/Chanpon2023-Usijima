## 鎌攻撃 視線追跡
execute as @e[tag=Usjm.Mobs-Main,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 as @s[dx=0] if data entity @s {HurtTime:0s} run tag @s add Usjm.Mobs-Hit
execute as @e[tag=Usjm.Mobs-Main,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 as @s[dx=0] if score @p[tag=Usjm.AttackerPlayer] Usjm.Combat.PlayerAttackCooldown matches 0 positioned ~0.99 ~0.99 ~0.99 positioned ~-0.32 ~-0.32 ~-0.32 as @e[tag=Usjm.Mobs-Main,dx=0.64,dy=0.64,dz=0.64,limit=3] if data entity @s {HurtTime:0s} run tag @s add Usjm.Mobs-Hit

execute as @e[tag=Usjm.Mobs-Main,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 as @s[dx=0] at @s if score @p[tag=Usjm.AttackerPlayer] Usjm.Combat.PlayerAttackCooldown matches 0 run particle sweep_attack ~ ~ ~ 0 0 0 1.25 1

execute unless entity @e[tag=Usjm.Mobs-Hit] positioned ^ ^ ^0.1 if entity @s[distance=..3] run function usjm-combat:ray_tracing/sickle
execute as @e[tag=Usjm.Mobs-Hit] at @s run function usjm-combat:player_attack/sickle

