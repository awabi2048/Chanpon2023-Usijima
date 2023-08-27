execute as @a[dx=0] positioned ~-0.99 ~-0.99 ~-0.99 as @s[dx=0] run tag @s add Usjm.Player.BypassInteraction

execute if entity @s[tag=Usjm.NPC.HasMenu] as @a[dx=0] positioned ~-0.99 ~-0.99 ~-0.99 as @s[dx=0] run tag @s add Usjm.Player.Menu

execute if entity @s[tag=Usjm.NPC.Shop] as @a[dx=0] positioned ~-0.99 ~-0.99 ~-0.99 as @s[dx=0] run tag @s add Usjm.Player.Shop

execute positioned ^ ^ ^0.1 if entity @s[distance=..4] unless entity @a[tag=Usjm.Player.BypassInteraction] run function usjm-core:click_detection/raycast_backto_player
