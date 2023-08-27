## チェストメニュー開いたとき　
# トリガー解除
advancement revoke @s only usjm-menu:opened

# 閉じた判定用
tag @s add Usjm.Player.Menu-Opened
scoreboard players set @s Usjm.Menu.CloseDetectTimer 20

# リンク
execute anchored eyes positioned ^ ^ ^ as @e[tag=Usjm.Menu,distance=..0.5] run tag @s add Usjm.Menu-Opened
scoreboard players operation @e[tag=Usjm.Menu-Opened,sort=nearest,limit=1] Usjm.Link = @s Usjm.Link

# 何のメニューか判定
function usjm-menu:raycast

execute as @e[tag=Usjm.NPC.Looked] on passengers run data modify storage usjm:menu OpenedMenuData set from entity @s data.Usjm.MenuData



tag @e[tag=Usjm.NPC.Looked] remove Usjm.NPC.Looked
