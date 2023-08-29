## Tick
#> 移動処理
function usjm-combat:magic/assets/generic/movement

#> 当たり判定
# 地面に衝突判定
execute unless block ~ ~ ~ #usjm:throughable run function usjm-combat:magic/assets/generic/on_ground

# モブに衝突判定
execute as @e[tag=Usjm.Mobs-Main,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 as @s[dx=0] run tag @s add Usjm.Mobs-Hit.Magic
execute if entity @e[tag=Usjm.Mobs-Hit.Magic] run function usjm-combat:magic/assets/generic/on_hit

#> 分岐処理
execute if data entity @s {data:{Usjm:{Magic:{Id:"0000-template"}}}} run function usjm-combat:magic/assets/0000-template/tick

