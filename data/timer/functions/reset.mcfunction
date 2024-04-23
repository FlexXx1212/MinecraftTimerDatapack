bossbar add timer {"text":"0","color":"green","bold":true}
bossbar set minecraft:timer color green
bossbar set minecraft:timer style notched_10
bossbar set minecraft:timer players @a
bossbar set minecraft:timer visible false
bossbar set minecraft:timer value 0
bossbar set minecraft:timer max 1
bossbar set minecraft:timer visible true

scoreboard objectives add time dummy
scoreboard players set tick time 0
scoreboard players set sec time 0
scoreboard players set min time 0
scoreboard players set hour time 0
scoreboard players set running time 0
scoreboard players set total time 0
scoreboard players set current time 0

scoreboard players set 0 time 0
scoreboard players set 60 time 60
scoreboard players set 3600 time 3600

scoreboard players set pausednoplayer time 0
scoreboard players set wasreset time 1
scoreboard players set hoursinseconds time 0
scoreboard players set minsinseconds time 0