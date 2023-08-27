## Mob召喚 (Test Zombie)
# 本体召喚
summon zombie ~ ~ ~ {Tags:["Usjm.Mobs","Usjm.Mobs-TestZombie","Usjm.Mobs-Main"]}

# 装備
item replace entity @e[tag=Usjm.Mobs-Main,sort=nearest,limit=1] armor.head with leather_helmet{Unbreakable:true,display:{color:16711680}}
item replace entity @e[tag=Usjm.Mobs-Main,sort=nearest,limit=1] armor.chest with leather_chestplate{Unbreakable:true,display:{color:16711680}}

# データ設定
data modify storage usjm:mobs SpawnData set value {}

data modify storage usjm:mobs SpawnData.Id set value "FireZombie"
data modify storage usjm:mobs SpawnData.Name set value '{"text":"火ゾンビ","color":"red","bold":true}'

data modify storage usjm:mobs SpawnData.MaxHealth set value 300
data modify storage usjm:mobs SpawnData.Strength set value 20
data modify storage usjm:mobs SpawnData.Defence set value 100
data modify storage usjm:mobs SpawnData.ExpAmount set value 50

data modify storage usjm:mobs SpawnData.Attribute set value "Fire"


function usjm-mobs:summon/generic

