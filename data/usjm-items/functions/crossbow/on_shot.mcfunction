## クロスボウ(矢)発射
#> 矢本体の発射 & マーカー乗せる
summon arrow ~ ~ ~ {Tags:["Usjm.Misc.PlayerArrow"],life:1170s,crit:true}
summon marker ~ ~ ~ {Tags:["Usjm.Misc.ArrowMarker"],data:{Usjm:{ArrowData:{Damage:0,Attribute:"None"}}}}

ride @e[tag=Usjm.Misc.ArrowMarker,sort=nearest,limit=1] mount @e[tag=Usjm.Misc.PlayerArrow,sort=nearest,limit=1]

#> 構成エンティティとプレイヤー紐づけ
data modify entity @e[tag=Usjm.Misc.PlayerArrow,sort=nearest,limit=1] Owner set from entity @s UUID

scoreboard players operation @e[tag=Usjm.Misc.PlayerArrow,sort=nearest,limit=1] Usjm.UUID = @s Usjm.UUID
scoreboard players operation @e[tag=Usjm.Misc.ArrowMarker,sort=nearest,limit=1] Usjm.UUID = @s Usjm.UUID

#> 攻撃力などデータ乗せる
# ダメージ計算
execute store result score $Crossbow.Damage Usjm.Temp run data get entity @s SelectedItem.tag.Usjm.ItemStats.Damage

# レベル倍率
execute store result score $DamageMultiple Usjm.Temp run scoreboard players get @s Usjm.PlayerStats.PlayerLevel
scoreboard players operation $DamageMultiple Usjm.Temp *= #2 Usjm.Constant

scoreboard players add $DamageMultiple Usjm.Temp 100

scoreboard players operation $Crossbow.Damage Usjm.Temp *= $DamageMultiple Usjm.Temp
scoreboard players operation $Crossbow.Damage Usjm.Temp /= #100 Usjm.Constant

# 職業倍率
scoreboard players set $DamageMultiple Usjm.Temp 100

execute if entity @s[tag=Usjm.Job-Swordsman] run scoreboard players set $DamageMultiple Usjm.Temp 100
execute if entity @s[tag=Usjm.Job-Wizard] run scoreboard players set $DamageMultiple Usjm.Temp 75
execute if entity @s[tag=Usjm.Job-Hunter] run scoreboard players set $DamageMultiple Usjm.Temp 135
execute if entity @s[tag=Usjm.Job-Warrior] run scoreboard players set $DamageMultiple Usjm.Temp 90

scoreboard players operation $Crossbow.Damage Usjm.Temp *= $DamageMultiple Usjm.Temp
scoreboard players operation $Crossbow.Damage Usjm.Temp /= #100 Usjm.Constant

data modify storage usjm:items CrossbowData set value {}

data modify storage usjm:items SelectedItemData set from entity @s SelectedItem.tag.Usjm

execute store result storage usjm:items CrossbowData.Damage int 1 run scoreboard players get $Crossbow.Damage Usjm.Temp
data modify storage usjm:items CrossbowData.Attribute set from storage usjm:items SelectedItemData.Misc.Attribute

data modify entity @e[tag=Usjm.Misc.ArrowMarker,sort=nearest,limit=1] data.Usjm.ArrowData set from storage usjm:items CrossbowData

#> 矢にMotion設定
execute store result score $Crossbow.ArrowSpeed Usjm.Temp run data get storage usjm:items SelectedItemData.ItemStats.ArrowSpeed 100

execute anchored eyes run tp @e[tag=Usjm.Misc.PlayerArrow,sort=nearest,limit=1] ^ ^ ^0.25

# 単位ベクトル取得
function usjm-misc:get_vector 

# ArrowSpeed を乗算
execute store result score $Vector.X Usjm.Temp run data get storage usjm:misc UnitVector[0] 3000
execute store result score $Vector.Y Usjm.Temp run data get storage usjm:misc UnitVector[1] 3000
execute store result score $Vector.Z Usjm.Temp run data get storage usjm:misc UnitVector[2] 3000

scoreboard players operation $Vector.X Usjm.Temp *= $Crossbow.ArrowSpeed Usjm.Temp
scoreboard players operation $Vector.Y Usjm.Temp *= $Crossbow.ArrowSpeed Usjm.Temp
scoreboard players operation $Vector.Z Usjm.Temp *= $Crossbow.ArrowSpeed Usjm.Temp

# データをMotionに代入
data modify storage usjm:items CrossbowData.Motion set value [0.0d,0.0d,0.0d]
execute store result storage usjm:items CrossbowData.Motion[0] double 0.00001 run scoreboard players get $Vector.X Usjm.Temp
execute store result storage usjm:items CrossbowData.Motion[1] double 0.00001 run scoreboard players get $Vector.Y Usjm.Temp
execute store result storage usjm:items CrossbowData.Motion[2] double 0.00001 run scoreboard players get $Vector.Z Usjm.Temp

data modify entity @e[tag=Usjm.Misc.PlayerArrow,sort=nearest,limit=1] Motion set from storage usjm:items CrossbowData.Motion

# チャージ済みフラグ解除
item modify entity @s weapon.mainhand usjm-items:crossbow/toggle_charged_flag

# 演出
playsound entity.arrow.shoot master @a ~ ~ ~ 1 1.25
playsound entity.arrow.shoot master @a ~ ~ ~ 0.5 0.8

