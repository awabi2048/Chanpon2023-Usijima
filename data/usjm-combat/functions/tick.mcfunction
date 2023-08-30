## 
execute as @a if score @s Usjm.Combat.PlayerAttackCooldown matches 1.. run scoreboard players remove @s Usjm.Combat.PlayerAttackCooldown 1

execute at @a[tag=Usjm.Player-SkillSelect] as @e[tag=Usjm.Marker-SkillSelect,distance=..5] at @s positioned ^ ^ ^2 rotated ~ ~90 run function usjm-combat:active_skills/select/particle

execute at @a[tag=Usjm.Player-SkillSelect] as @e[tag=Usjm.Marker-SkillSelect,distance=..8] if score @s Usjm.InteractionTimer matches 1.. run scoreboard players remove @s Usjm.InteractionTimer 1
execute at @a[tag=Usjm.Player-SkillSelect] as @e[tag=Usjm.Marker-SkillSelect,distance=..8] if score @s Usjm.InteractionTimer matches 0 at @s run function usjm-combat:active_skills/select/cancel

# ダメージ表示を削除
execute at @a[tag=Usjm.Player] as @e[tag=Usjm.Combat.DamageDisplay-Item,distance=..64] if data entity @s {OnGround:true} run function usjm-combat:player_attack/damage_process/digit_display/remove

#> Magic
# タイマー → 一定時間操作なかったらキャンセル
execute as @a[tag=Usjm.Player] if score @s Usjm.Combat.Magic.Casting-Timer matches 1.. run scoreboard players remove @s Usjm.Combat.Magic.Casting-Timer 1
execute as @a[tag=Usjm.Player] if score @s Usjm.Combat.Magic.Casting-Timer matches 0 at @s run function usjm-combat:magic/casting/cancel

# tick
execute as @a[tag=Usjm.Player] at @s as @e[tag=Usjm.Combat.Magic-Marker,distance=..64] if score @s Usjm.Link = @p Usjm.UUID at @s run function usjm-combat:magic/assets/generic/tick

execute as @a[tag=Usjm.Player] at @s as @e[tag=Usjm.Combat.Magic-Marker,distance=65..] run kill @s
