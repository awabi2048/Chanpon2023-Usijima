## プレイヤー攻撃されたとき
# トリガーリセット
advancement revoke @s only usjm-combat:player_damaged/by_enemy

# 攻撃者のデータを取得
execute on attacker on passengers on passengers run data modify storage usjm:combat AttackedMobData set from entity @s data.Usjm.Mobs

#> ダメージ計算
# データ取得
scoreboard players operation $PlayerHealth Usjm.Temp = @s Usjm.PlayerStats.Health
scoreboard players operation $PlayerDefence Usjm.Temp = @s Usjm.PlayerStats.Defence

execute store result score $FinalDamage Usjm.Temp run data get storage usjm:combat AttackedMobData.Strength

# 計算
scoreboard players add $PlayerDefence Usjm.Temp 100

scoreboard players set $DamageReduction Usjm.Temp 10000
scoreboard players operation $DamageReduction Usjm.Temp /= $PlayerDefence Usjm.Temp

scoreboard players operation $FinalDamage Usjm.Temp *= $DamageReduction Usjm.Temp
scoreboard players operation $FinalDamage Usjm.Temp /= #100 Usjm.Constant

# 減算
scoreboard players operation @s Usjm.PlayerStats.Health -= $FinalDamage Usjm.Temp

# モブ側の攻撃処理
function usjm-mobs:on_attack

#> 属性関連処理
# プレイヤーの属性を取得 未定

# 攻撃者側の属性からプレイヤーにデバフを付与


# ダメージ表示


# ダメージ表示
# tellraw @s [{"text": "[","color": "white"},{"text": "→","color": "red"},{"text": "] ","color": "white"},{"text": "【","color": "white"},{"nbt":"AttackedMobData.Name","storage": "usjm:combat","interpret": true},{"text": "】","color": "white"},{"text": "から ","color": "gray"},{"text": "\uE0F0\uF822","color": "white"},{"text": "-","color": "red"},{"score":{"name": "$FinalDamage","objective": "Usjm.Temp"},"color": "red"},{"text": " (","color": "white"},{"text": "\uE0F0\uF822","color": "white"},{"score":{"name": "@s","objective": "Usjm.PlayerStats.Health"},"color": "green"},{"text": "/","color": "gray"},{"score":{"name": "@s","objective": "Usjm.PlayerStats.MaxHealth"},"color": "gray"},{"text": ")","color": "white"}]
