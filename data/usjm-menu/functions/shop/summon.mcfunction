## ショップNPC召喚時
# 各種設定用マーカー
summon villager ~ ~ ~ {Tags:["Usjm.NPC-Shop","Usjm.IgnoreInteraction"],NoAI:true,Invulnerable:true}
summon marker ~ ~ ~ {Tags:["Usjm.NPC-Shop.Marker"]}

data modify entity @e[tag=Usjm.NPC-Shop.Marker,sort=nearest,limit=1] data.Usjm.NPC-Shop.Id set from storage usjm:menu ShopData.Id
data modify entity @e[tag=Usjm.NPC-Shop.Marker,sort=nearest,limit=1] data.Usjm.NPC-Shop.Name set from storage usjm:menu ShopData.Name

tag @e[tag=Usjm.Temp,sort=nearest,limit=1] remove Usjm.Temp

# 各種表示の用意
summon text_display ~ ~ ~ {Tags:["Usjm.NPC-Shop.Display"],billboard:vertical,transformation:{right_rotation:[0,0,0,1],left_rotation:[0,0,0,1],translation:[0.0f,0.75f,0.0f],scale:[1,1,1]}}

summon interaction ~ ~ ~ {Tags:["Usjm.NPC-Shop.Hitbox","Usjm.NPC-Shop.Hitbox-0"],width:0.65f,height:0.6f}
summon interaction ~ ~ ~ {Tags:["Usjm.NPC-Shop.Hitbox","Usjm.NPC-Shop.Hitbox-1"],width:0.65f,height:-1.4f}

data modify entity @e[tag=Usjm.NPC-Shop.Display,sort=nearest,limit=1] text set value '[{"text":"《","color":"white"},{"nbt":"data.Usjm.NPC-Shop.Name","entity":"@e[tag=Usjm.NPC-Shop.Marker,sort=nearest,limit=1]","interpret":true},{"text":"》","color":"white"}]'

ride @e[tag=Usjm.NPC-Shop.Hitbox-0,sort=nearest,limit=1] mount @e[tag=Usjm.NPC-Shop,sort=nearest,limit=1]
ride @e[tag=Usjm.NPC-Shop.Hitbox-1,sort=nearest,limit=1] mount @e[tag=Usjm.NPC-Shop,sort=nearest,limit=1]

ride @e[tag=Usjm.NPC-Shop.Display,sort=nearest,limit=1] mount @e[tag=Usjm.NPC-Shop,sort=nearest,limit=1]
ride @e[tag=Usjm.NPC-Shop.Marker,sort=nearest,limit=1] mount @e[tag=Usjm.NPC-Shop.Display,sort=nearest,limit=1]


# リセット
tag @e[tag=Usjm.Temp,sort=nearest,limit=1] remove Usjm.Temp

