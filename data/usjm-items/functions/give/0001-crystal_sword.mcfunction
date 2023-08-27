## 0000-template
#> アイテムのデータを設定
# キャッシュデータをリセット
data modify storage usjm:items CustomGive set value {}

# Stats
data modify storage usjm:items CustomGive.Stats.Damage set value 120
data modify storage usjm:items CustomGive.Stats.Mana set value 50
data modify storage usjm:items CustomGive.Stats.Luck set value 5

# 種類・レアリティ
data modify storage usjm:items CustomGive.Other.ItemType set value "Sword"
data modify storage usjm:items CustomGive.Other.Rarity set value 3b

# アイテムそのものの設定
data modify storage usjm:items CustomGive.Item.id set value "minecraft:stick"
data modify storage usjm:items CustomGive.Item.tag set value {CustomModelData:1010000}

data modify storage usjm:items CustomGive.Item.tag.display.Name set value '{"text":"クリスタルの剣","color":"light_purple","italic":false}'
data modify storage usjm:items CustomGive.Item.tag.display.Lore set value ['{"text":"輝く刀身","color":"white","italic":false}']

#> 共通の処理
function usjm-items:give/generic

