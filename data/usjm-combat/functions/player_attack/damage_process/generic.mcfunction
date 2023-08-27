## ダメージ処理
#> ステータスを取得
execute store result score $FinalDamage Usjm.Temp run data get entity @p[tag=Usjm.AttackerPlayer] SelectedItem.tag.Usjm.ItemStats.Damage

#> ダメージの種類によって処理を分岐, ダメージ計算
execute if data storage usjm:combat {DamageProcessing:{Type:"Physical-Melee"}} run function usjm-combat:player_attack/damage_process/physical-melee
execute if data storage usjm:combat {DamageProcessing:{Type:"Physical-Ranged"}} run function usjm-combat:player_attack/damage_process/physical-ranged
execute if data storage usjm:combat {DamageProcessing:{Type:"Magical"}} run function usjm-combat:player_attack/damage_process/magical

#> モブへダメージ処理
    # モブの防御力
    execute store result score $MobDefence Usjm.Temp on passengers on passengers run data get entity @s data.Usjm.Mobs.Defence
    scoreboard players add $MobDefence Usjm.Temp 100

    scoreboard players set $MobDamageReduction Usjm.Temp 10000
    scoreboard players operation $MobDamageReduction Usjm.Temp /= $MobDefence Usjm.Temp

    # 軽減後のダメージを取得
    scoreboard players operation $FinalDamage Usjm.Temp *= $MobDamageReduction Usjm.Temp
    scoreboard players operation $FinalDamage Usjm.Temp /= #100 Usjm.Constant

    # 体力スコアから減算, マーカーにデータ戻す
    execute store result score $MobHealth Usjm.Temp on passengers on passengers run data get entity @s data.Usjm.Mobs.Health
    scoreboard players operation $MobHealth Usjm.Temp -= $FinalDamage Usjm.Temp

    execute on passengers on passengers store result entity @s data.Usjm.Mobs.Health int 1 run scoreboard players get $MobHealth Usjm.Temp 

    # 体力が0以下なら死亡処理
    execute on passengers on passengers run data modify storage usjm:combat DiedMobData set from entity @s data.Usjm.Mobs
    execute if score $MobHealth Usjm.Temp matches ..0 run function usjm-mobs:on_death
    

#> ダメージ表示
function usjm-combat:player_attack/damage_process/digit_display/_

#> モブ側のダメージ処理
function usjm-mobs:on_damaged

#> 体力バーの再設定
    # モブの体力が0以下なら以下は中断
    execute if score $MobHealth Usjm.Temp matches ..0 run return -1

    # 最大体力を取得
    execute on passengers on passengers store result score $MobMaxHealth Usjm.Temp run data get entity @s data.Usjm.Mobs.MaxHealth

    # 全30個のバーのうち, 満たすもの・満たさないものの個数を設定
    scoreboard players operation $HealthBarDigit.Remaining Usjm.Temp = $MobHealth Usjm.Temp 
    scoreboard players operation $HealthBarDigit.Remaining Usjm.Temp *= #30 Usjm.Constant

    scoreboard players operation $HealthBarDigit.Remaining Usjm.Temp /= $MobMaxHealth Usjm.Temp 

    scoreboard players set $HealthBarDigit.Missing Usjm.Temp 30
    scoreboard players operation $HealthBarDigit.Missing Usjm.Temp -= $HealthBarDigit.Remaining Usjm.Temp

    # 再帰して個数からストレージに収納
    data modify storage usjm:combat MobHealthBar.Missing set value []
    data modify storage usjm:combat MobHealthBar.Remaining set value []
    function usjm-mobs:health_bar_updating/missing
    function usjm-mobs:health_bar_updating/remaining

    # バーの色を残り体力によって変更 (~33% → 赤 / 33%~66% → 黄 / 66%~100% → 緑)
    execute on passengers on passengers store result score $MobHealthPercentage Usjm.Temp run data get entity @s data.Usjm.Mobs.Health 100
    execute on passengers on passengers store result score $MobMaxHealth Usjm.Temp run data get entity @s data.Usjm.Mobs.MaxHealth

    scoreboard players operation $MobHealthPercentage Usjm.Temp /= $MobMaxHealth Usjm.Temp

    execute on passengers if score $MobHealthPercentage Usjm.Temp matches ..33 run data modify entity @e[tag=Usjm.Mobs.Display,sort=nearest,limit=1] text set value '[{"text":"【","color":"white"},{"nbt":"data.Usjm.Mobs.Name","entity":"@e[tag=Usjm.Mobs.Marker,sort=nearest,limit=1]","interpret":true},{"text":"】\\n","color":"white"},{"text":"(","color":"gray"},{"nbt":"data.Usjm.Mobs.Health","entity":"@e[tag=Usjm.Mobs.Marker,sort=nearest,limit=1]","color":"red"},{"text":"/","color":"gray"},{"nbt":"data.Usjm.Mobs.MaxHealth","entity":"@e[tag=Usjm.Mobs.Marker,sort=nearest,limit=1]","color":"gray"},{"text":")","color":"gray"},"\\n",{"nbt":"MobHealthBar.Remaining","color":"red","storage":"usjm:combat","interpret":true},{"nbt":"MobHealthBar.Missing","color":"gray","storage":"usjm:combat","interpret":true}]'
    execute on passengers if score $MobHealthPercentage Usjm.Temp matches 34..66 run data modify entity @e[tag=Usjm.Mobs.Display,sort=nearest,limit=1] text set value '[{"text":"【","color":"white"},{"nbt":"data.Usjm.Mobs.Name","entity":"@e[tag=Usjm.Mobs.Marker,sort=nearest,limit=1]","interpret":true},{"text":"】\\n","color":"white"},{"text":"(","color":"gray"},{"nbt":"data.Usjm.Mobs.Health","entity":"@e[tag=Usjm.Mobs.Marker,sort=nearest,limit=1]","color":"yellow"},{"text":"/","color":"gray"},{"nbt":"data.Usjm.Mobs.MaxHealth","entity":"@e[tag=Usjm.Mobs.Marker,sort=nearest,limit=1]","color":"gray"},{"text":")","color":"gray"},"\\n",{"nbt":"MobHealthBar.Remaining","color":"yellow","storage":"usjm:combat","interpret":true},{"nbt":"MobHealthBar.Missing","color":"gray","storage":"usjm:combat","interpret":true}]'
    execute on passengers if score $MobHealthPercentage Usjm.Temp matches 67.. run data modify entity @e[tag=Usjm.Mobs.Display,sort=nearest,limit=1] text set value '[{"text":"【","color":"white"},{"nbt":"data.Usjm.Mobs.Name","entity":"@e[tag=Usjm.Mobs.Marker,sort=nearest,limit=1]","interpret":true},{"text":"】\\n","color":"white"},{"text":"(","color":"gray"},{"nbt":"data.Usjm.Mobs.Health","entity":"@e[tag=Usjm.Mobs.Marker,sort=nearest,limit=1]","color":"green"},{"text":"/","color":"gray"},{"nbt":"data.Usjm.Mobs.MaxHealth","entity":"@e[tag=Usjm.Mobs.Marker,sort=nearest,limit=1]","color":"gray"},{"text":")","color":"gray"},"\\n",{"nbt":"MobHealthBar.Remaining","color":"green","storage":"usjm:combat","interpret":true},{"nbt":"MobHealthBar.Missing","color":"gray","storage":"usjm:combat","interpret":true}]'

