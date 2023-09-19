#> GUI用トロッコ召喚
# 召喚
execute anchored eyes run summon chest_minecart ^ ^ ^ {Tags:["Usjm.Menu"],Silent:true,CustomDisplayTile:true,DisplayState:{Name:"minecraft:air"},NoGravity:true,Team:"Usjm.NoCollision"}

# スコア設定
execute as @e[tag=Usjm.Menu,distance=..8] unless score @s Usjm.InteractionTimer matches -2147483648..2147483647 run scoreboard players set @s Usjm.InteractionTimer 2

# kill
execute as @e[tag=Usjm.Menu,distance=..8] if score @s Usjm.InteractionTimer matches 1.. run scoreboard players remove @s Usjm.InteractionTimer 1
execute as @e[tag=Usjm.Menu,distance=..8] if score @s Usjm.InteractionTimer matches 0 run kill @s
