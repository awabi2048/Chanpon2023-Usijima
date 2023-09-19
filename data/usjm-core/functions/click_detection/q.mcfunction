## Q Click
# トリガー解除
scoreboard players set @s Usjm.DropKey 0

#> アイテム返却
# アイテムデータ保管用コンテナの設置
setblock 0 -64 0 bedrock
setblock 0 -64 0 shulker_box{Items:[{Slot:0b,Count:1b,id:"minecraft:stone"}]} replace

# アイテムデータを移動
data modify storage usjm:temp Item set value {}
execute anchored eyes positioned ^ ^ ^ as @e[type=item,sort=nearest,limit=1] run data modify storage usjm:temp Item set from entity @s Item
data modify storage usjm:temp Item merge value {Slot:0b}

data modify block 0 -64 0 Items[0] set from storage usjm:temp Item

# loot giveでアイテムgive
loot give @s mine 0 -64 0 debug_stick

# 落としたアイテムを消去
execute anchored eyes positioned ^ ^ ^ run kill @e[type=item,sort=nearest,limit=1]

# 
say Pressed Q
