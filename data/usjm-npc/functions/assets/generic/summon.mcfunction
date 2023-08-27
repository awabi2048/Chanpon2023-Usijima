## モブ召喚時 共通部分
# 
data modify storage usjm:npc SpawnData.Dialogue.Content.Main append value -1
data modify storage usjm:npc SpawnData.Dialogue.Content.DuringQuest append value -1
data modify storage usjm:npc SpawnData.Dialogue.Content.AfterQuest append value -1

# 各種設定用マーカー
summon marker ~ ~ ~ {Tags:["Usjm.NPC.Marker"]}

data modify entity @e[tag=Usjm.NPC.Marker,sort=nearest,limit=1] data.Usjm.NPC set from storage usjm:npc SpawnData

data modify entity @e[tag=Usjm.NPC.Marker,sort=nearest,limit=1] data.Usjm.NPC.Dialogue.Current set value []

attribute @e[tag=Usjm.NPC-Main,sort=nearest,limit=1] generic.movement_speed base set 0

# 各種表示の用意
summon text_display ~ ~ ~ {Tags:["Usjm.NPC.Display"],billboard:vertical,transformation:{right_rotation:[0,0,0,1],left_rotation:[0,0,0,1],scale:[0.75f,0.75f,0.75f],translation:[0.0f,0.66f,0.0f]},shadow:true}

data modify entity @e[tag=Usjm.NPC.Display,sort=nearest,limit=1] text set value '[{"text":"《","color":"white"},{"nbt":"data.Usjm.NPC.Name","entity":"@e[tag=Usjm.NPC.Marker,sort=nearest,limit=1]","interpret":true},{"text":"》","color":"white"}]'

ride @e[tag=Usjm.NPC.Display,sort=nearest,limit=1] mount @e[tag=Usjm.NPC-Main,sort=nearest,limit=1]
ride @e[tag=Usjm.NPC.Marker,sort=nearest,limit=1] mount @e[tag=Usjm.NPC.Display,sort=nearest,limit=1]

# 無敵化
effect give @e[tag=Usjm.NPC-Main,sort=nearest,limit=1] resistance infinite 4 true
effect give @e[tag=Usjm.NPC-Main,sort=nearest,limit=1] fire_resistance infinite 4 true
attribute @e[tag=Usjm.NPC-Main,sort=nearest,limit=1] generic.knockback_resistance base set 1.0

