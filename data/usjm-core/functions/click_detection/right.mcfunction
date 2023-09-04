## 右クリック時検知
# トリガー
advancement revoke @s only usjm-core:click_detection/right

# NPCに話しかけたとき
scoreboard players set $RaycastReturn Usjm.Temp -1
execute store result score $RaycastReturn Usjm.Temp anchored eyes run function usjm-core:raycast
execute if score $RaycastReturn Usjm.Temp matches 1.. run function usjm-npc:dialogue
execute if score $RaycastReturn Usjm.Temp matches 1.. run return -1

# 杖
execute if predicate usjm-combat:holding_item/wand run function usjm-combat:magic/casting/on_click/right

# アイテムの装備
execute if predicate usjm-items:holding_item/tag/is_armor run function usjm-items:set_armor

# クロスボウの使用
execute if predicate usjm-items:holding_item/tag/crossbow_charged run function usjm-items:crossbow/test_shotable
execute if predicate usjm-items:holding_item/tag/crossbow_charged if data storage usjm:items {Crossbow:{CanShot:true}} unless predicate usjm-core:flag/sneaking run function usjm-items:crossbow/on_shot



