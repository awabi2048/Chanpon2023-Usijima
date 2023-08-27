## 剣攻撃 視線追跡
execute as @e[tag=Usjm.Mobs-Main,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 as @s[dx=0] positioned ~0.99 ~0.99 ~0.99 if data entity @s {HurtTime:0s} run tag @s add Usjm.Mobs-Hit
execute as @e[tag=Usjm.Mobs-Main,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 as @s[dx=0] positioned ~0.99 ~0.99 ~0.99 if score @p[tag=Usjm.AttackerPlayer] Usjm.Combat.PlayerAttackCooldown matches 0 positioned ~-0.25 ~-0.25 ~-0.25 as @e[tag=Usjm.Mobs-Main,dx=0.5,dy=0.5,dz=0.5,limit=3] if data entity @s {HurtTime:0s} run tag @s add Usjm.Mobs-Hit

execute unless entity @e[tag=Usjm.Mobs-Hit] positioned ^ ^ ^0.1 if entity @s[distance=..3.25] run function usjm-combat:ray_tracing/sword
execute as @e[tag=Usjm.Mobs-Hit] at @s run function usjm-combat:player_attack/sword

