## プレイヤーがモブに攻撃した際
# 手に持っている武器に応じて視線追跡・攻撃処理
tag @s add Usjm.AttackerPlayer

execute if predicate usjm-combat:holding_item/sword anchored eyes run function usjm-combat:ray_tracing/sword
execute if predicate usjm-combat:holding_item/hammer anchored eyes run function usjm-combat:ray_tracing/hammer
execute if predicate usjm-combat:holding_item/spear anchored eyes run function usjm-combat:ray_tracing/spear


data modify storage usjm:combat TargetedMobExist set value false
tag @s remove Usjm.AttackerPlayer
