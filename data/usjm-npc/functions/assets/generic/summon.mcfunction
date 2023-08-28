## NPC召喚時 共通部分
# 各種設定用マーカー
summon marker ~ ~ ~ {Tags:["Usjm.NPC.Marker"]}

attribute @e[tag=Usjm.NPC-Main,sort=nearest,limit=1] generic.movement_speed base set 0

# データ設定
data modify storage usjm:index Search.Index set from storage usjm:index npc
data modify storage usjm:index Search.in set from storage usjm:npc SpawnData.Id
function usjm-core:index_search

data modify entity @e[tag=Usjm.NPC.Marker,sort=nearest,limit=1] data.Usjm.NPC set from storage usjm:index Search.out
data modify entity @e[tag=Usjm.NPC.Marker,sort=nearest,limit=1] data.Usjm.NPC.Dialogue.Current set value []

# 各種表示の用意
summon text_display ~ ~ ~ {Tags:["Usjm.NPC.Display"],billboard:vertical,transformation:{right_rotation:[0,0,0,1],left_rotation:[0,0,0,1],scale:[0.75f,0.75f,0.75f],translation:[0.0f,0.66f,0.0f]},shadow:true}

data modify entity @e[tag=Usjm.NPC.Display,sort=nearest,limit=1] text set value '[{"text":"《","color":"white"},{"nbt":"data.Usjm.NPC.Name","entity":"@e[tag=Usjm.NPC.Marker,sort=nearest,limit=1]","interpret":true},{"text":"》","color":"white"}]'

ride @e[tag=Usjm.NPC.Display,sort=nearest,limit=1] mount @e[tag=Usjm.NPC-Main,sort=nearest,limit=1]
ride @e[tag=Usjm.NPC.Marker,sort=nearest,limit=1] mount @e[tag=Usjm.NPC.Display,sort=nearest,limit=1]

# 無敵化
effect give @e[tag=Usjm.NPC-Main,sort=nearest,limit=1] resistance infinite 4 true
effect give @e[tag=Usjm.NPC-Main,sort=nearest,limit=1] fire_resistance infinite 4 true
attribute @e[tag=Usjm.NPC-Main,sort=nearest,limit=1] generic.knockback_resistance base set 1.0

