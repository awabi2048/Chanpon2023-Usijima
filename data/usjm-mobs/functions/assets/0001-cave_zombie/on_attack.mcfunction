## 0001-cave_zombie: プレイヤーへ攻撃時
# 効果音
playsound entity.zombie.ambient master @a ~ ~ ~ 1 1

# ダメージの種類を設定
data modify storage usjm:combat DamageProcessing.Type set value "Physical-Mob"

#> 全mob共通の処理
function usjm-mobs:assets/generic/on_attack
