## 右クリック
#> 演出
# 効果音
playsound item.flintandsteel.use master @s ~ ~ ~ 1 1.25

function usjm-combat:magic/casting/on_click/generic
scoreboard players add @s Usjm.Combat.Magic.Casting-Operation 2

# 操作表示
function usjm-combat:magic/casting/title_display/_

execute if score @s Usjm.Combat.Magic.Casting-Count matches 3 run function usjm-combat:magic/casting/_

# 
