## Interaction召喚
# 普通に召喚するとチャンクの端でバグるので、プレイヤーの視界を囲むようにボックスを召喚

# 前後左右
summon interaction ~ ~-0.25 ~0.15 {Tags:["Usjm.Interaction","Usjm.Temp"],width:0.15f,height:0.4f}

summon interaction ~ ~-0.25 ~-0.15 {Tags:["Usjm.Interaction","Usjm.Temp"],width:0.15f,height:0.4f}

summon interaction ~0.15 ~-0.25 ~ {Tags:["Usjm.Interaction","Usjm.Temp"],width:0.15f,height:0.4f}

summon interaction ~-0.15 ~-0.25 ~ {Tags:["Usjm.Interaction","Usjm.Temp"],width:0.15f,height:0.4f}

# 上
summon interaction ~ ~0.15 ~ {Tags:["Usjm.Interaction","Usjm.Temp"],width:0.6f,height:0.01f}

# 下
summon interaction ~ ~-0.25 ~ {Tags:["Usjm.Interaction","Usjm.Temp"],width:0.6f,height:0.01f}

# Link
scoreboard players operation @e[tag=Usjm.Temp] Usjm.Link = @s Usjm.UUID

scoreboard players set @e[tag=Usjm.Temp] Usjm.InteractionTimer 3

tag @e[tag=Usjm.Temp] remove Usjm.Temp
