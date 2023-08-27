## クロスボウの矢 的に着弾

# ダメージ値など取り出し
data modify storage usjm-items: CrossbowData set from entity @s data.Usjm.ArrowData

# ダメージ処理
execute as @e[tag=Usjm.Mobs-Main,nbt={HurtTime:10s},sort=nearest,limit=1] run tag @s add Usjm.Mobs-Hit
execute as @a[tag=Usjm.Player] if score @s Usjm.UUID = @e[tag=Usjm.Misc.ArrowMarker,sort=nearest,limit=1] Usjm.UUID run tag @s add Usjm.AttackerPlayer

data modify storage usjm:combat DamageProcessing.Type set value "Physical-Ranged"
execute as @e[tag=Usjm.Mobs-Hit] at @s run function usjm-combat:player_attack/damage_process/generic

# 後始末
kill @s

tag @a remove Usjm.AttackerPlayer
tag @e remove Usjm.Mobs-Hit
