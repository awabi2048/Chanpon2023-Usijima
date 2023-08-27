execute as @e[tag=Usjm.NPC.HasMenu,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 as @s[dx=0] run tag @s add Usjm.NPC.Looked
execute unless entity @e[tag=Usjm.NPC.Looked] positioned ^ ^ ^0.1 if entity @s[distance=..10] run function usjm-menu:raycast
