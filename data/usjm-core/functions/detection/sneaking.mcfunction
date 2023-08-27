## シフト時検知
# クロスボウチャージ中
execute if predicate usjm-items:holding_item/tag/crossbow unless predicate usjm-items:holding_item/tag/crossbow_charged if predicate usjm-core:flag/sneaking at @s if score @s Usjm.Combat.Quiver matches 1.. run function usjm-items:crossbow/charging
execute unless predicate usjm-core:flag/sneaking if score @s Usjm.Combat.BowCharging matches 1.. run scoreboard players set @s Usjm.Combat.BowCharging 0
    