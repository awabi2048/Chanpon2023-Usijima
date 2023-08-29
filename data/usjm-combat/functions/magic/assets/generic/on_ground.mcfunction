## 地面に衝突判定

#> 分岐処理
execute if data entity @s {data:{Usjm:{Magic:{Id:"0000-template"}}}} run function usjm-combat:magic/assets/0000-template/on_ground


say hit ground
kill @s
