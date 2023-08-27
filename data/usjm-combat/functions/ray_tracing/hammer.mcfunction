## 剣攻撃 視線追跡
execute as @e[tag=Usjm.Mobs-Main,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 as @s[dx=0] if data entity @s {HurtTime:0s} run tag @s add Usjm.Mobs-Hit
execute as @e[tag=Usjm.Mobs-Main,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 as @s[dx=0] if score @p[tag=Usjm.AttackerPlayer] Usjm.Combat.PlayerAttackCooldown matches 0 positioned ~0.99 ~0.99 ~0.99 positioned ~-0.5 ~-0.5 ~-0.5 as @e[tag=Usjm.Mobs-Main,dx=1,dy=1,dz=1,limit=5] if data entity @s {HurtTime:0s} run tag @s add Usjm.Mobs-Hit

execute as @e[tag=Usjm.Mobs-Main,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 as @s[dx=0] at @s if score @p[tag=Usjm.AttackerPlayer] Usjm.Combat.PlayerAttackCooldown matches 0 run particle explosion ~ ~0.25 ~ 0 0 0 0.01 1

execute unless entity @e[tag=Usjm.Mobs-Hit] positioned ^ ^ ^0.1 if entity @s[distance=..2.5] run function usjm-combat:ray_tracing/hammer
execute as @e[tag=Usjm.Mobs-Hit] at @s run function usjm-combat:player_attack/hammer

