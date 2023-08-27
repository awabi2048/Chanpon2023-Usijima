## mob関連処理共通部分: プレイヤーへ攻撃時
#> ダメージの表示
data modify storage usjm:combat DamageProcessing.isCrit set value false
function usjm-combat:player_attack/damage_process/digit_display/_
