## 0001-cave_zombie: 死亡時
# 効果音
playsound entity.zombie.death master @a ~ ~ ~ 1 1

# Loot Table
loot spawn ~ ~ ~ loot usjm-mobs:0001-cave_zombie

#> 全mob共通の処理
function usjm-mobs:assets/generic/on_death
