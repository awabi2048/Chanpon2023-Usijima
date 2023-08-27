## Mob召喚 (Test Zombie)
# 本体召喚
summon zombie ~ ~ ~ {Tags:["Usjm.Mobs","Usjm.Mobs-TestZombie","Usjm.Mobs-Main"]}

# 装備
item replace entity @e[tag=Usjm.Mobs-Main,sort=nearest,limit=1] armor.head with leather_helmet{Unbreakable:true,display:{color:1638655}}
item replace entity @e[tag=Usjm.Mobs-Main,sort=nearest,limit=1] armor.chest with leather_chestplate{Unbreakable:true,display:{color:28415}}

# データ設定
data modify storage usjm:mobs SpawnData set value {}

data modify storage usjm:mobs SpawnData.Id set value "WaterZombie"
data modify storage usjm:mobs SpawnData.Name set value '{"text":"水属性ぞんび","color":"aqua","bold":false}'

data modify storage usjm:mobs SpawnData.MaxHealth set value 200
data modify storage usjm:mobs SpawnData.Strength set value 200
data modify storage usjm:mobs SpawnData.Defence set value 60
data modify storage usjm:mobs SpawnData.ExpAmount set value 100

data modify storage usjm:mobs SpawnData.Attribute set value "Water"


function usjm-mobs:summon/generic

