## 地面に衝突判定

#> 分岐処理
execute if data entity @s {data:{Usjm:{Magic:{Id:"0000-template"}}}} run function usjm-combat:magic/assets/0000-template/on_ground
execute if data entity @s {data:{Usjm:{Magic:{Id:"0001-basic"}}}} run function usjm-combat:magic/assets/0001-basic/on_ground
execute if data entity @s {data:{Usjm:{Magic:{Id:"0002-flame"}}}} run function usjm-combat:magic/assets/0002-flame/on_ground

kill @s
