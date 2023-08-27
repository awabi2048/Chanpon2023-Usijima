## 剣攻撃 視線追跡
execute as @e[tag=Usjm.Mobs-Main,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 as @s[dx=0] positioned ~0.99 ~0.99 ~0.99 if data entity @s {HurtTime:0s} run tag @s add Usjm.Mobs-Hit

execute as @e[tag=Usjm.Mobs-Main,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 as @s[dx=0] at @s if score @p[tag=Usjm.AttackerPlayer] Usjm.Combat.PlayerAttackCooldown matches 0 if data entity @s {HurtTime:0s} run particle crit ~ ~0.5 ~ 0.2 0.3 0.2 0.5 10

execute unless entity @e[tag=Usjm.Mobs-Hit] positioned ^ ^ ^0.1 if entity @s[distance=..4] run function usjm-combat:ray_tracing/spear
execute as @e[tag=Usjm.Mobs-Hit] at @s run function usjm-combat:player_attack/spear

