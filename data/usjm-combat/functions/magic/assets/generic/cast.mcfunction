## 左クリック魔法 
#> ダメージ計算
# 魔法辞退の基礎ダメージを取得
execute store result score $FinalDamage Usjm.Temp run data get storage usjm:index Search.out.BaseDamage 

# 杖のダメージを取得
execute store result score $WandDamage Usjm.Temp run data get entity @s SelectedItem.tag.Usjm.ItemStats.Damage
scoreboard players add $WandDamage Usjm.Temp 200

# 最大マナ量で乗算
scoreboard players operation $FinalDamage Usjm.Temp *= @s Usjm.PlayerStats.ManaPool
scoreboard players operation $FinalDamage Usjm.Temp /= #100 Usjm.Constant

# 杖ダメージで乗算
scoreboard players operation $FinalDamage Usjm.Temp *= $WandDamage Usjm.Temp
scoreboard players operation $FinalDamage Usjm.Temp /= #200 Usjm.Constant

#> エンティティまわり
# Marker召喚, 
execute anchored eyes run summon marker ^ ^-0.3 ^ {data:{Usjm:{Magic:{Speed:0.000d,Damage:0}}},Tags:["Usjm.Combat.Magic-Marker","Usjm.Temp"]}

# データ設定
data modify entity @e[tag=Usjm.Temp,limit=1] data.Usjm.Magic.Speed set from storage usjm:index Search.out.Speed
data modify entity @e[tag=Usjm.Temp,limit=1] data.Usjm.Magic.Id set from storage usjm:index Search.out.Id

data modify entity @e[tag=Usjm.Temp,limit=1] Rotation set from entity @s Rotation

execute store result entity @e[tag=Usjm.Temp,limit=1] data.Usjm.Magic.Damage int 1 run scoreboard players get $FinalDamage Usjm.Temp

scoreboard players operation @e[tag=Usjm.Temp,limit=1] Usjm.Link = @s Usjm.UUID

# tag
tag @e[tag=Usjm.Temp,limit=1] remove Usjm.Temp


