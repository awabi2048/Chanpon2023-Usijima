## モブに衝突判定
#> 分岐処理
execute if data entity @s {data:{Usjm:{Magic:{Id:"0000-template"}}}} run function usjm-combat:magic/assets/0000-template/on_hit
execute if data entity @s {data:{Usjm:{Magic:{Id:"0001-basic"}}}} run function usjm-combat:magic/assets/0001-basic/on_hit
execute if data entity @s {data:{Usjm:{Magic:{Id:"0002-flame"}}}} run function usjm-combat:magic/assets/0002-flame/on_hit

#> ダメージ計算等
# ダメージ計算
execute store result score $FinalDamage Usjm.Temp run data get entity @s data.Usjm.Magic.Damage
data modify storage usjm:combat DamageProcessing.Type set value "Magical"

execute as @e[tag=Usjm.Mobs-Hit.Magic] run function usjm-combat:player_attack/damage_process/generic


#> 後処理
# モブのヒットタグ除去
tag @e[tag=Usjm.Mobs-Hit.Magic] remove Usjm.Mobs-Hit.Magic

# エンティティをkill
kill @s
