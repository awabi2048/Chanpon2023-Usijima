## ダメージ表示
# itemを召喚, データ編集
execute anchored eyes run loot spawn ^ ^ ^ loot usjm-combat:misc/damage_display

tag @e[nbt={Item:{tag:{Usjm:{Custom:{DamageDisplayModified:false}}}}}] add Usjm.Combat.DamageDisplay-Item
tag @e[nbt={Item:{tag:{Usjm:{Custom:{DamageDisplayModified:false}}}}}] add Usjm.Combat.DamageDisplay-Summoned
tag @e[nbt={Item:{tag:{Usjm:{Custom:{DamageDisplayModified:false}}}}}] add Usjm.Combat.DamageDisplay

data modify entity @e[limit=1,nbt={Item:{tag:{Usjm:{Custom:{DamageDisplayModified:false}}}}}] PickupDelay set value -1
data modify entity @e[limit=1,nbt={Item:{tag:{Usjm:{Custom:{DamageDisplayModified:false}}}}}] Item.tag.Usjm.Custom.DamageDisplayModified set value true

# text_display召喚
summon text_display ~ ~ ~ {text:'{"text":"default"}',Tags:["Usjm.Combat.DamageDisplay","Usjm.Combat.DamageDisplay-Main","Usjm.Combat.DamageDisplay-Summoned"],"billboard":"center",background:0,shadow:true,transformation:{right_rotation:[0,0,0,1],left_rotation:[0,0,0,1],scale:[1.5f,1.5f,1.5f]}}

execute as @e[tag=Usjm.Combat.DamageDisplay-Summoned,type=text_display] at @s run ride @s mount @e[tag=Usjm.Combat.DamageDisplay-Summoned,type=item,limit=1]

tag @e remove Usjm.Combat.DamageDisplay-Summoned

#> displayのデータ(色)を設定
# 統合
execute if data storage usjm:combat {DamageProcessing:{Type:"Physical-Melee"}} run data modify storage usjm:combat DamageProcessing.Type set value "Physical-Player"
execute if data storage usjm:combat {DamageProcessing:{Type:"Physical-Ranged"}} run data modify storage usjm:combat DamageProcessing.Type set value "Physical-Player"
execute if data storage usjm:combat {DamageProcessing:{Type:"Magical"}} run data modify storage usjm:combat DamageProcessing.Type set value "Magical-Player"

# プレイヤーのダメージ
execute if data storage usjm:combat {DamageProcessing:{Type:"Physical-Player",isCrit:false}} run data modify entity @e[tag=Usjm.Combat.DamageDisplay,sort=nearest,limit=1] text set value '{"score":{"name": "$FinalDamage","objective": "Usjm.Temp"},"color":"red"}'
execute if data storage usjm:combat {DamageProcessing:{Type:"Physical-Player",isCrit:true}} run data modify entity @e[tag=Usjm.Combat.DamageDisplay,sort=nearest,limit=1] text set value '{"score":{"name": "$FinalDamage","objective": "Usjm.Temp"},"color":"#ff0000"}'

execute if data storage usjm:combat {DamageProcessing:{Type:"Magical-Player"}} run data modify entity @e[tag=Usjm.Combat.DamageDisplay,sort=nearest,limit=1] text set value '{"score":{"name": "$FinalDamage","objective": "Usjm.Temp"},"color":"aqua"}'

# 敵モブのダメージ
execute if data storage usjm:combat {DamageProcessing:{Type:"Physical-Mob"}} run data modify entity @e[tag=Usjm.Combat.DamageDisplay,sort=nearest,limit=1] text set value '{"score":{"name": "$FinalDamage","objective": "Usjm.Temp"},"color":"dark_red"}'
execute if data storage usjm:combat {DamageProcessing:{Type:"Magical-Mob"}} run data modify entity @e[tag=Usjm.Combat.DamageDisplay,sort=nearest,limit=1] text set value '{"score":{"name": "$FinalDamage","objective": "Usjm.Temp"},"color":"#00aaff"}'
