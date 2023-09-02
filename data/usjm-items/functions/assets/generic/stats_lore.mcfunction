# Stats Lore
item modify block 0 -64 0 container.0 usjm-items:set_lore/stats/note

execute unless data storage usjm:index {Search:{out:{ItemStats:{Damage:0}}}} run item modify block 0 -64 0 container.0 usjm-items:set_lore/stats/damage
execute unless data storage usjm:index {Search:{out:{ItemStats:{Health:0}}}} run item modify block 0 -64 0 container.0 usjm-items:set_lore/stats/health
execute unless data storage usjm:index {Search:{out:{ItemStats:{Defence:0}}}} run item modify block 0 -64 0 container.0 usjm-items:set_lore/stats/defence
execute unless data storage usjm:index {Search:{out:{ItemStats:{Mana:0}}}} run item modify block 0 -64 0 container.0 usjm-items:set_lore/stats/mana
execute unless data storage usjm:index {Search:{out:{ItemStats:{Luck:0}}}} run item modify block 0 -64 0 container.0 usjm-items:set_lore/stats/luck
execute unless data storage usjm:index {Search:{out:{ItemStats:{Speed:0}}}} run item modify block 0 -64 0 container.0 usjm-items:set_lore/stats/speed
