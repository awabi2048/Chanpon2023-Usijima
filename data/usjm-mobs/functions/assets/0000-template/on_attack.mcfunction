## 0000-template: プレイヤーへ攻撃時
# 効果音
playsound entity.skeleton.step master @a ~ ~ ~ 1 0.75

# ダメージの種類を設定
data modify storage usjm:combat DamageProcessing.Type set value "Physical-Mob"

#> 全mob共通の処理
function usjm-mobs:assets/generic/on_attack
