## 左クリック
#> 演出
# 効果音
playsound ui.button.click master @s ~ ~ ~ 1 2

function usjm-combat:magic/casting/on_click/generic
scoreboard players add @s Usjm.Combat.Magic.Casting-Operation 1

# 操作表示
function usjm-combat:magic/casting/title_display/_

execute if score @s Usjm.Combat.Magic.Casting-Count matches 3 run function usjm-combat:magic/casting/_

#> タイトル表示

