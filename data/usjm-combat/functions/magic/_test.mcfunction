data modify storage usjm:index player.magic set value []

data modify storage usjm:index player.magic append value {}

data modify storage usjm:index player.magic[-1].Id set from entity @s UUID


# 1
data modify storage usjm:index player.magic[-1].Assignment append value {}

data modify storage usjm:index player.magic[-1].Assignment[-1].MagicId set value "0000-template"
data modify storage usjm:index player.magic[-1].Assignment[-1].Id set value 121

# 2
data modify storage usjm:index player.magic[-1].Assignment append value {}

data modify storage usjm:index player.magic[-1].Assignment[-1].MagicId set value "0001-basic"
data modify storage usjm:index player.magic[-1].Assignment[-1].Id set value 221

# 3
data modify storage usjm:index player.magic[-1].Assignment append value {}

data modify storage usjm:index player.magic[-1].Assignment[-1].MagicId set value "0002-tesaa"
data modify storage usjm:index player.magic[-1].Assignment[-1].Id set value 111



tellraw @s ["Operation: ",{"nbt":"player.magic[-1].Operation","storage":"usjm:index"},", MagicId: ",{"nbt":"player.magic[-1].MagicId","storage":"usjm:index"},"を設定しました。"]
