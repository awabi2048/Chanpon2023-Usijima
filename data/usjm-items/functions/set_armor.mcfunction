## 装備できるアイテムをクリックした場合
# 全く同じなら処理中断

# アイテムの一時置き場を召喚
summon item_display ~ ~ ~ {Tags:["Usjm.Temp"],item:{id:"minecraft:stone",Count:1b}}

data modify storage usjm:items ArmorSwapping set value {Feet:false,Legs:false,Chest:false,Head:false}

execute if data entity @s Inventory[{Slot:100b}] run data modify storage usjm:items ArmorSwapping.Feet set value true
execute if data entity @s Inventory[{Slot:101b}] run data modify storage usjm:items ArmorSwapping.Legs set value true
execute if data entity @s Inventory[{Slot:102b}] run data modify storage usjm:items ArmorSwapping.Chest set value true
execute if data entity @s Inventory[{Slot:103b}] run data modify storage usjm:items ArmorSwapping.Head set value true

# アイテムを移し替え, 手元を空に
item replace entity @e[tag=Usjm.Temp,limit=1] container.0 from entity @s weapon.mainhand
item replace entity @s weapon.mainhand with air

# アイテムの種類を設定
data modify storage usjm:items ArmorSwapping.HoldingItem set value "none"

execute if data entity @e[tag=Usjm.Temp,limit=1] {item:{id:"minecraft:chainmail_boots"}} run data modify storage usjm:items ArmorSwapping.HoldingItem set value "Boots"
execute if data entity @e[tag=Usjm.Temp,limit=1] {item:{id:"minecraft:chainmail_chestplate"}} run data modify storage usjm:items ArmorSwapping.HoldingItem set value "Chestplate"
execute if data entity @e[tag=Usjm.Temp,limit=1] {item:{id:"minecraft:chainmail_leggings"}} run data modify storage usjm:items ArmorSwapping.HoldingItem set value "Leggings"
execute if data entity @e[tag=Usjm.Temp,limit=1] {item:{id:"minecraft:chainmail_helmet"}} run data modify storage usjm:items ArmorSwapping.HoldingItem set value "Helmet"

execute if data storage usjm:items {ArmorSwapping:{HoldingItem:"none"}} run data modify storage usjm:items ArmorSwapping.HoldingItem set value "Helmet"

#> 枠が空いていればアイテムを移動する
# 足
execute if data storage usjm:items {ArmorSwapping:{HoldingItem:"Boots"}} if data storage usjm:items {ArmorSwapping:{Feet:false}} run item replace entity @s armor.feet from entity @e[tag=Usjm.Temp,limit=1] container.0

execute if data storage usjm:items {ArmorSwapping:{HoldingItem:"Boots"}} if data storage usjm:items {ArmorSwapping:{Feet:true}} run item replace entity @s weapon.mainhand from entity @s armor.feet
execute if data storage usjm:items {ArmorSwapping:{HoldingItem:"Boots"}} if data storage usjm:items {ArmorSwapping:{Feet:true}} run item replace entity @s armor.feet from entity @e[tag=Usjm.Temp,limit=1] container.0

# 脚
execute if data storage usjm:items {ArmorSwapping:{HoldingItem:"Leggings"}} if data storage usjm:items {ArmorSwapping:{Legs:false}} run item replace entity @s armor.legs from entity @e[tag=Usjm.Temp,limit=1] container.0

execute if data storage usjm:items {ArmorSwapping:{HoldingItem:"Leggings"}} if data storage usjm:items {ArmorSwapping:{Legs:true}} run item replace entity @s weapon.mainhand from entity @s armor.legs
execute if data storage usjm:items {ArmorSwapping:{HoldingItem:"Leggings"}} if data storage usjm:items {ArmorSwapping:{Legs:true}} run item replace entity @s armor.legs from entity @e[tag=Usjm.Temp,limit=1] container.0

# 胴
execute if data storage usjm:items {ArmorSwapping:{HoldingItem:"Chestplate"}} if data storage usjm:items {ArmorSwapping:{Chest:false}} run item replace entity @s armor.chest from entity @e[tag=Usjm.Temp,limit=1] container.0

execute if data storage usjm:items {ArmorSwapping:{HoldingItem:"Chestplate"}} if data storage usjm:items {ArmorSwapping:{Chest:true}} run item replace entity @s weapon.mainhand from entity @s armor.chest
execute if data storage usjm:items {ArmorSwapping:{HoldingItem:"Chestplate"}} if data storage usjm:items {ArmorSwapping:{Chest:true}} run item replace entity @s armor.chest from entity @e[tag=Usjm.Temp,limit=1] container.0

# 頭
execute if data storage usjm:items {ArmorSwapping:{HoldingItem:"Helmet"}} if data storage usjm:items {ArmorSwapping:{Head:false}} run item replace entity @s armor.head from entity @e[tag=Usjm.Temp,limit=1] container.0

execute if data storage usjm:items {ArmorSwapping:{HoldingItem:"Helmet"}} if data storage usjm:items {ArmorSwapping:{Head:true}} run item replace entity @s weapon.mainhand from entity @s armor.head
execute if data storage usjm:items {ArmorSwapping:{HoldingItem:"Helmet"}} if data storage usjm:items {ArmorSwapping:{Head:true}} run item replace entity @s armor.head from entity @e[tag=Usjm.Temp,limit=1] container.0


#> 成功時処理
# 効果音
playsound item.armor.equip_generic master @s ~ ~ ~ 1 1

kill @e[tag=Usjm.Temp]
