## クエスト進捗処理: Fetch
# Shift押下時 → 手持ちのみ納品, Shift非押下時 → インベントリ内納品
data modify storage usjm:temp ItemCalc.in set from storage usjm:index Search.out.Subject.Target
execute if predicate usjm:flags/is_sneaking run function usjm-quest:misc/inventory_fetching/_
