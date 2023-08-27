execute positioned ^ ^ ^0.5 if block ~ ~ ~ air if entity @s[distance=..4] run function usjm-menu:shop/raycast
execute positioned ^ ^ ^0.5 as @e[tag=Usjm.Menu.Shop.Usjm.Shop-000] positioned ~-50 ~-50 ~-50 if predicate hitbox:hitbox run function usjm-menu:shop/looking_at
