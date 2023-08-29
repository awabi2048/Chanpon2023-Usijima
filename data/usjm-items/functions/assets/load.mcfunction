## assetsをロード
# データをリセット
data modify storage usjm:index item set value {has_uuid:[],no_uuid:[]}

# UUIDつき
function usjm-items:assets/has_uuid/0000-template/define
function usjm-items:assets/has_uuid/0001-crystal_sword/define
function usjm-items:assets/has_uuid/0002-wooden_wand/define

# UUIDなし
function usjm-items:assets/no_uuid/0000-template/define

