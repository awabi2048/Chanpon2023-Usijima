## プレイヤー攻撃時 槌
# タグ除去
tag @s remove Usjm.Mobs-Hit

# ダメージ処理
data modify storage usjm:combat DamageProcessing.Type set value "Physical-Melee"
function usjm-combat:player_attack/damage_process/generic

# ノックバック
scoreboard players set $KnockbackMultiple Usjm.Temp 70
execute if score $FinalDamage Usjm.Temp matches 1.. run function usjm-combat:player_attack/knockback

