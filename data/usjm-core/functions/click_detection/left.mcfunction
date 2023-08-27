## 左クリック時検知
# トリガー
advancement revoke @s only usjm-core:click_detection/left

#> 条件分岐
#>> スキル選択



#>> 攻撃用
# 目の前に敵がいる
data modify storage usjm:core PlayerRaycastSucceeded set value false

execute store result storage usjm:core PlayerRaycastSucceeded byte 1 anchored eyes run function usjm-core:click_detection/raycast_mobs
execute if data storage usjm:core {PlayerRaycastSucceeded:true} run function usjm-combat:on_player_attack

# 攻撃クールダウン設定
execute store result score @s Usjm.Combat.PlayerAttackCooldown run data get entity @s SelectedItem.tag.Usjm.ItemStats.AtkSpeed 1.75

# 演出
execute if predicate usjm-combat:holding_item/sword run playsound entity.player.attack.sweep master @a ~ ~ ~ 0.5 1
execute if predicate usjm-combat:holding_item/hammer run playsound entity.player.attack.sweep master @a ~ ~ ~ 0.5 0.66
execute if predicate usjm-combat:holding_item/spear run playsound entity.player.attack.sweep master @a ~ ~ ~ 0.5 1.5
execute if predicate usjm-combat:holding_item/sickle run playsound entity.player.attack.sweep master @a ~ ~ ~ 0.5 1.15

execute if predicate usjm-combat:holding_item/wand run playsound block.enchantment_table.use master @a ~ ~ ~ 0.5 1.25
