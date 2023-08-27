## プレイヤーレベル表示：経験値
# リセット
xp set @s 0 levels
xp set @s 0 points

#> 経験値バー設定
xp set @s 129 levels

# 割合で取得
scoreboard players operation $ExpProgress Usjm.Temp = @s Usjm.PlayerStats.CurrentExp
scoreboard players operation $ExpProgress Usjm.Temp *= #200 Usjm.Constant

scoreboard players operation $ExpProgress Usjm.Temp /= @s Usjm.PlayerStats.RequiredExp

# バイナリ方式で加算
execute if score $ExpProgress Usjm.Temp matches 128.. run xp add @s 128 points
execute if score $ExpProgress Usjm.Temp matches 128.. run scoreboard players remove $ExpProgress Usjm.Temp 128
execute if score $ExpProgress Usjm.Temp matches 64.. run xp add @s 64 points
execute if score $ExpProgress Usjm.Temp matches 64.. run scoreboard players remove $ExpProgress Usjm.Temp 64
execute if score $ExpProgress Usjm.Temp matches 32.. run xp add @s 32 points
execute if score $ExpProgress Usjm.Temp matches 32.. run scoreboard players remove $ExpProgress Usjm.Temp 32
execute if score $ExpProgress Usjm.Temp matches 16.. run xp add @s 16 points
execute if score $ExpProgress Usjm.Temp matches 16.. run scoreboard players remove $ExpProgress Usjm.Temp 16
execute if score $ExpProgress Usjm.Temp matches 8.. run xp add @s 8 points
execute if score $ExpProgress Usjm.Temp matches 8.. run scoreboard players remove $ExpProgress Usjm.Temp 8
execute if score $ExpProgress Usjm.Temp matches 4.. run xp add @s 4 points
execute if score $ExpProgress Usjm.Temp matches 4.. run scoreboard players remove $ExpProgress Usjm.Temp 4
execute if score $ExpProgress Usjm.Temp matches 2.. run xp add @s 2 points
execute if score $ExpProgress Usjm.Temp matches 2.. run scoreboard players remove $ExpProgress Usjm.Temp 2
execute if score $ExpProgress Usjm.Temp matches 1.. run xp add @s 1 points
execute if score $ExpProgress Usjm.Temp matches 1.. run scoreboard players remove $ExpProgress Usjm.Temp 1

#> 経験値レベル設定
# リセット
xp set @s 0 levels

# レベルを取得
scoreboard players operation $ExpLevel Usjm.Temp = @s Usjm.PlayerStats.PlayerLevel

# バイナリ方式で加算
execute if score $ExpLevel Usjm.Temp matches 128.. run xp add @s 128 levels
execute if score $ExpLevel Usjm.Temp matches 128.. run scoreboard players remove $ExpLevel Usjm.Temp 128
execute if score $ExpLevel Usjm.Temp matches 64.. run xp add @s 64 levels
execute if score $ExpLevel Usjm.Temp matches 64.. run scoreboard players remove $ExpLevel Usjm.Temp 64
execute if score $ExpLevel Usjm.Temp matches 32.. run xp add @s 32 levels
execute if score $ExpLevel Usjm.Temp matches 32.. run scoreboard players remove $ExpLevel Usjm.Temp 32
execute if score $ExpLevel Usjm.Temp matches 16.. run xp add @s 16 levels
execute if score $ExpLevel Usjm.Temp matches 16.. run scoreboard players remove $ExpLevel Usjm.Temp 16
execute if score $ExpLevel Usjm.Temp matches 8.. run xp add @s 8 levels
execute if score $ExpLevel Usjm.Temp matches 8.. run scoreboard players remove $ExpLevel Usjm.Temp 8
execute if score $ExpLevel Usjm.Temp matches 4.. run xp add @s 4 levels
execute if score $ExpLevel Usjm.Temp matches 4.. run scoreboard players remove $ExpLevel Usjm.Temp 4
execute if score $ExpLevel Usjm.Temp matches 2.. run xp add @s 2 levels
execute if score $ExpLevel Usjm.Temp matches 2.. run scoreboard players remove $ExpLevel Usjm.Temp 2
execute if score $ExpLevel Usjm.Temp matches 1.. run xp add @s 1 levels
execute if score $ExpLevel Usjm.Temp matches 1.. run scoreboard players remove $ExpProgress Usjm.Temp 1

#> その他
# 効果音
playsound entity.experience_orb.pickup master @s ~ ~ ~ 0.5 2
