## クロスボウチャージ中
# 1tick目: チャージ目標時間を設定
execute if score @s Usjm.Combat.BowCharging matches 0 store result score @s Usjm.Combat.BowChargeTime run data get entity @s SelectedItem.tag.Usjm.ItemStats.ChargeTime

# チャージ中スコア加算
scoreboard players add @s Usjm.Combat.BowCharging 1

# チャージの割合が一定以上なら効果音
scoreboard players operation $Crossbow.ChargePercentage Usjm.Temp = @s Usjm.Combat.BowCharging
scoreboard players operation $Crossbow.ChargePercentage Usjm.Temp *= #100 Usjm.Constant
scoreboard players operation $Crossbow.ChargePercentage Usjm.Temp /= @s Usjm.Combat.BowChargeTime

#> 演出
# title表示
title @s times 0t 10t 0t
title @s title ""

execute if score $Crossbow.ChargePercentage Usjm.Temp matches 0..33 run title @s subtitle ["\uF80E",{"score":{"name": "$Crossbow.ChargePercentage","objective": "Usjm.Temp"},"bold": false},"%\uF82E",{"text": "Charge","color": "#e0ffff","bold": true},{"text": ":","color": "gray","bold": true},"\uF822",{"score":{"name": "$Crossbow.ChargePercentage","objective": "Usjm.Temp"},"color": "red","bold": false},{"text": "%","color": "gray","bold": false}]
execute if score $Crossbow.ChargePercentage Usjm.Temp matches 34..66 run title @s subtitle ["\uF80E",{"score":{"name": "$Crossbow.ChargePercentage","objective": "Usjm.Temp"},"bold": false},"%\uF82E",{"text": "Charge","color": "#e0ffff","bold": true},{"text": ":","color": "gray","bold": true},"\uF822",{"score":{"name": "$Crossbow.ChargePercentage","objective": "Usjm.Temp"},"color": "yellow","bold": false},{"text": "%","color": "gray","bold": false}]
execute if score $Crossbow.ChargePercentage Usjm.Temp matches 67.. run title @s subtitle ["\uF80E",{"score":{"name": "$Crossbow.ChargePercentage","objective": "Usjm.Temp"},"bold": false},"%\uF82E",{"text": "Charge","color": "#e0ffff","bold": true},{"text": ":","color": "gray","bold": true},"\uF822",{"score":{"name": "$Crossbow.ChargePercentage","objective": "Usjm.Temp"},"color": "green","bold": false},{"text": "%","color": "gray","bold": false}]

# 効果音
execute if score @s Usjm.Combat.BowChargeTime = @s Usjm.Combat.BowCharging run playsound minecraft:entity.item_frame.place master @a ~ ~ ~ 1 0.8
execute if score @s Usjm.Combat.BowChargeTime = @s Usjm.Combat.BowCharging run playsound minecraft:item.flintandsteel.use master @a ~ ~ ~ 1 1
execute if score @s Usjm.Combat.BowChargeTime = @s Usjm.Combat.BowCharging run playsound minecraft:block.stone.break master @a ~ ~ ~ 1 1
execute if score @s Usjm.Combat.BowChargeTime = @s Usjm.Combat.BowCharging run playsound item.crossbow.loading_end master @a ~ ~ ~ 1 1

# チャージ済みフラグ
execute if score @s Usjm.Combat.BowChargeTime = @s Usjm.Combat.BowCharging unless predicate usjm-items:holding_item/tag/crossbow_charged run scoreboard players remove @s Usjm.Combat.Quiver 1
execute if score @s Usjm.Combat.BowChargeTime = @s Usjm.Combat.BowCharging unless predicate usjm-items:holding_item/tag/crossbow_charged run item modify entity @s weapon.mainhand usjm-items:crossbow/toggle_charged_flag
