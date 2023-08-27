execute positioned ^ ^ ^0.1 if block ~ ~ ~ #usjm:throughable if entity @s[distance=..5] unless entity @s[tag=Usjm.Player.BypassInteraction] run function usjm-core:click_detection/raycast_exception

execute as @e[tag=Usjm.IgnoreInteraction,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 as @s[dx=0] positioned ~0.99 ~0.99 ~0.99 rotated ~ ~180 positioned ^ ^ ^0.1 run function usjm-core:click_detection/raycast_backto_player

