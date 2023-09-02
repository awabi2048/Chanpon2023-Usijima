## ## アイテム Give用
# placeでデータを作成
function usjm-items:assets/generic/place

# /lootからプレイヤーに付与 → インベントリ埋まっていると消える為spawn
loot spawn ~ ~ ~ mine 0 -64 0 debug_stick

data modify entity @e[type=item,sort=nearest,limit=1] PickupDelay set value 0

# (0, -64, 0)をリセット
setblock 0 -64 0 bedrock
