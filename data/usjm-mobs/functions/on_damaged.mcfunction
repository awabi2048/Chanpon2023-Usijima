## モブ死亡処理 → 種類ごとに処理分岐
execute if data storage usjm:combat {DiedMobData:{Id:"0000-template"}} run function usjm-mobs:assets/0000-template/on_damaged
execute if data storage usjm:combat {DiedMobData:{Id:"0001-cave_zombie"}} run function usjm-mobs:assets/0001-cave_zombie/on_damaged
