## 0000-template
#> アイテムのデータを設定
# キャッシュデータをリセット
data modify storage usjm:items CustomGive set value {}

# Stats
data modify storage usjm:items CustomGive.Stats.Damage set value 2048
data modify storage usjm:items CustomGive.Stats.Health set value 100
data modify storage usjm:items CustomGive.Stats.Luck set value 128

# 種類・レアリティ
data modify storage usjm:items CustomGive.Other.ItemType set value "Sword"
data modify storage usjm:items CustomGive.Other.Rarity set value 5b

# アイテムそのものの設定
data modify storage usjm:items CustomGive.Item.id set value "minecraft:stick"
data modify storage usjm:items CustomGive.Item.tag set value {CustomModelData:1010000}

data modify storage usjm:items CustomGive.Item.tag.display.Name set value '{"text":"テンプレート","color":"#e64ee6","italic":false}'
data modify storage usjm:items CustomGive.Item.tag.display.Lore set value ['{"text":"この欄には全角１２文字迄","italic":false}']

#> 共通の処理
function usjm-items:give/generic

