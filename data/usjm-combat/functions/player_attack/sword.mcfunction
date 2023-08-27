## プレイヤー攻撃時 剣
# タグ除去
tag @s remove Usjm.Mobs-Hit

# ダメージ処理
data modify storage usjm:combat DamageProcessing.Type set value "Physical-Melee"
function usjm-combat:player_attack/damage_process/generic

# ノックバック
scoreboard players set $KnockbackMultiple Usjm.Temp 100
execute if score $FinalDamage Usjm.Temp matches 1.. run function usjm-combat:player_attack/knockback

# 演出
execute as @p[tag=Usjm.AttackerPlayer] if score @s Usjm.Combat.PlayerAttackCooldown matches 0 at @s anchored eyes positioned ^ ^-0.9 ^1.25 run particle sweep_attack ~ ~ ~ 0 0 0 1.75 2
