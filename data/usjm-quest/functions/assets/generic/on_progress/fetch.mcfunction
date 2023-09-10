## クエスト進捗処理: Fetch
# インベントリ内を検索して納品
data modify storage usjm:quest InventoryFetching.in set from storage usjm:index Search.out.Subject.Target
function usjm-quest:misc/inventory_fetching/_

#> 非完了時処理
# ログ出力
execute if data storage usjm:index {Search:{out:{Type:"Main"}}} run data modify storage usjm:temp QuestDisplay.Type set value '{"text":"メインクエスト","color":"red"}'
execute if data storage usjm:index {Search:{out:{Type:"Sub"}}} run data modify storage usjm:temp QuestDisplay.Type set value '{"text":"サブクエスト","color":"red"}'

execute if data storage usjm:quest {InventoryFetching:{Done:false}} run tellraw @s [{"nbt":"QuestDisplay.Type","storage":"usjm:temp","interpret": true},{"text": "『","color": "white","bold": true},{"nbt":"Search.out.DisplayName","storage":"usjm:index","interpret": true,"color": "white","bold": true},{"text": "』","color": "white","bold": true}]



# 完了処理
execute if data storage usjm:quest {InventoryFetching:{Done:true}} run function usjm-quest:assets/generic/on_finish
