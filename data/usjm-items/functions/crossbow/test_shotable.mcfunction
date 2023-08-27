## クロスボウが発射可能か判定
#> 各条件を全て検査
data modify storage usjm:items Crossbow.CanShot set value true

# Id 取得
# data modify storage usjm:items Crossbow.Id set from entity @s SelectedItem.tag.Usjm.Id

# 矢が1本以上あるか判定
# data modify storage usjm:items Crossbow.CanShot set value false
