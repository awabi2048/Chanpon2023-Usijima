## 詠唱クリック時 共通処理
# 
execute if score @s Usjm.Combat.Magic.Casting-Timer matches ..20 run scoreboard players set @s Usjm.Combat.Magic.Casting-Count 0
execute if score @s Usjm.Combat.Magic.Casting-Timer matches ..20 run scoreboard players set @s Usjm.Combat.Magic.Casting-Operation 0
execute if score @s Usjm.Combat.Magic.Casting-Timer matches ..20 run scoreboard players set @s Usjm.Combat.Magic.Casting-Timer -1

# 現在の操作回数を記録, 取得
scoreboard players add @s Usjm.Combat.Magic.Casting-Count 1
scoreboard players operation @s Usjm.Combat.Magic.Casting-Operation *= #10 Usjm.Constant

# タイマーを設定 → 一定時間次の操作なければキャンセル
scoreboard players set @s Usjm.Combat.Magic.Casting-Timer 30


