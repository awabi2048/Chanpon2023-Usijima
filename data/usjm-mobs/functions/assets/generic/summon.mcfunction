## mob関連処理共通部分: 召喚時
#> 各種データの保存用マーカー
# 召喚 
summon marker ~ ~ ~ {Tags:["Usjm.Mobs.Marker"]} 

# データを検索, 移動
data modify storage usjm:mobs Search.Index set from storage usjm:mobs Index
data modify storage usjm:mobs Search.in set from storage usjm:mobs SpawnData.Id
function usjm-mobs:search

data modify entity @e[tag=Usjm.Mobs.Marker,sort=nearest,limit=1] data.Usjm.Mobs set from storage usjm:mobs Search.out

#> 付属エンティティの用意
# text_display → 表示名・体力(数値)・体力(ゲージ)
summon text_display ~ ~ ~ {Tags:["Usjm.Mobs.Display"],billboard:center,transformation:{right_rotation:[0,0,0,1],left_rotation:[0,0,0,1],scale:[0.75f,0.75f,0.75f],translation:[0.0f,0.66f,0.0f]},background:0,shadow:true,shadow_strength:1}

# interaction → 意図しないクリック判定の発生を防止
summon interaction ~ ~ ~ {Tags:["Usjm.Mobs.Hitbox","Usjm.Mobs.Hitbox-0"],width:0.65f,height:0.6f}
summon interaction ~ ~ ~ {Tags:["Usjm.Mobs.Hitbox","Usjm.Mobs.Hitbox-1"],width:0.65f,height:-1.4f}

#> 召喚したエンティティのあれこれ
# 騎乗
ride @e[tag=Usjm.Mobs.Hitbox-0,sort=nearest,limit=1] mount @e[tag=Usjm.Mobs-Main,sort=nearest,limit=1]
ride @e[tag=Usjm.Mobs.Hitbox-1,sort=nearest,limit=1] mount @e[tag=Usjm.Mobs-Main,sort=nearest,limit=1]

ride @e[tag=Usjm.Mobs.Display,sort=nearest,limit=1] mount @e[tag=Usjm.Mobs-Main,sort=nearest,limit=1]
ride @e[tag=Usjm.Mobs.Marker,sort=nearest,limit=1] mount @e[tag=Usjm.Mobs.Display,sort=nearest,limit=1]

# text_displayの表示を設定
data modify entity @e[tag=Usjm.Mobs.Display,sort=nearest,limit=1] text set value '[{"text":"【","color":"white"},{"nbt":"data.Usjm.Mobs.Name","entity":"@e[tag=Usjm.Mobs.Marker,sort=nearest,limit=1]","interpret":true},{"text":"】\\n","color":"white"},{"text":"(","color":"gray"},{"nbt":"data.Usjm.Mobs.Health","entity":"@e[tag=Usjm.Mobs.Marker,sort=nearest,limit=1]","color":"green"},{"text":"/","color":"gray"},{"nbt":"data.Usjm.Mobs.MaxHealth","entity":"@e[tag=Usjm.Mobs.Marker,sort=nearest,limit=1]","color":"gray"},{"text":")","color":"gray"},"\\n",{"text":"||||||||||||||||||||||||||||||","color":"green"}]'

#> 雑多な処理
# 無敵化
effect give @e[tag=Usjm.Mobs-Main,sort=nearest,limit=1] resistance infinite 4 true

# ノックバック耐性の付与
attribute @e[tag=Usjm.Mobs-Main,sort=nearest,limit=1] generic.knockback_resistance base set 1.0

# 無音化
data modify entity @e[tag=Usjm.Mobs-Main,sort=nearest,limit=1] Silent set value true
