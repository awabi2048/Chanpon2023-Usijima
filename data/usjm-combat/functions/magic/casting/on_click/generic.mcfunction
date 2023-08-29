## 詠唱クリック時 共通処理
# 現在の操作回数を記録, 取得
scoreboard players add @s Usjm.Combat.Magic.Casting-Count 1
scoreboard players operation @s Usjm.Combat.Magic.Casting-Operation *= #10 Usjm.Constant


# タイマーを設定 → 一定時間次の操作なければキャンセル
scoreboard players set @s Usjm.Combat.Magic.Casting-Timer 40
