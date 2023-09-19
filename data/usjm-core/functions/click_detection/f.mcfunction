## F click
# アイテム返却
summon item_display ~ ~ ~ {Tags:["Usjm.Temp"]}
item replace entity @e[tag=Usjm.Temp,limit=1] container.0 from entity @s weapon.offhand

item replace entity @s weapon.offhand from entity @s weapon.mainhand
item replace entity @s weapon.mainhand from entity @e[tag=Usjm.Temp,limit=1] container.0

kill @e[tag=Usjm.Temp]

#> アクティブスキル関連
# 選択
execute if predicate usjm:flags/is_sneaking unless entity @s[tag=Usjm.Player-SkillSelect] run function usjm-combat:active_skills/select/start

# 
