
# Pause if no Players on the Server
execute unless entity @p run scoreboard players set pausednoplayer time 1
execute if entity @p run scoreboard players set pausednoplayer time 0

# Winning screen & reset
execute if score tick time matches 0 if score hour time matches 0 if score min time matches 0 if score sec time matches 0 if score running time matches 1 if score pausednoplayer time matches 0 run title @a title {"text":"ZEIT VORBEI!","color":"red","bold":true,"italic":true}
execute if score tick time matches 0 if score hour time matches 0 if score min time matches 0 if score sec time matches 0 if score running time matches 1 if score pausednoplayer time matches 0 as @a at @s run playsound minecraft:entity.elder_guardian.curse record @s
execute if score tick time matches 0 if score hour time matches 0 if score min time matches 0 if score sec time matches 0 if score running time matches 1 if score pausednoplayer time matches 0 run function timer:load

# Calculate total time
execute if score running time matches 1 if score pausednoplayer time matches 0 if score wasreset time matches 1 run scoreboard players operation hoursinseconds time = hour time
execute if score running time matches 1 if score pausednoplayer time matches 0 if score wasreset time matches 1 run scoreboard players operation hoursinseconds time *= 3600 time
execute if score running time matches 1 if score pausednoplayer time matches 0 if score wasreset time matches 1 run scoreboard players operation minutesinseconds time = min time
execute if score running time matches 1 if score pausednoplayer time matches 0 if score wasreset time matches 1 run scoreboard players operation minutesinseconds time *= 60 time
execute if score running time matches 1 if score pausednoplayer time matches 0 if score wasreset time matches 1 run scoreboard players operation total time += hoursinseconds time
execute if score running time matches 1 if score pausednoplayer time matches 0 if score wasreset time matches 1 run scoreboard players operation total time += minutesinseconds time
execute if score running time matches 1 if score pausednoplayer time matches 0 if score wasreset time matches 1 run scoreboard players operation total time += sec time
execute if score running time matches 1 if score pausednoplayer time matches 0 run scoreboard players set wasreset time 0

# Put total and current in bossbar
execute if score running time matches 1 if score pausednoplayer time matches 0 store result bossbar minecraft:timer max run scoreboard players get total time
execute if score running time matches 1 if score pausednoplayer time matches 0 store result bossbar minecraft:timer value run scoreboard players get current time

# Calculate current time
execute if score tick time matches -1 run scoreboard players operation current time = hour time
execute if score tick time matches -1 run scoreboard players operation current time *= 60 time
execute if score tick time matches -1 run scoreboard players operation current time += min time
execute if score tick time matches -1 run scoreboard players operation current time *= 60 time
execute if score tick time matches -1 run scoreboard players operation current time += sec time
execute if score tick time matches -1 run scoreboard players operation current time += tick time

# handle timing overflows
execute if score hour time matches -1 run scoreboard players set hour time 0
execute if score min time matches -1 run scoreboard players remove hour time 1
execute if score min time matches -1 run scoreboard players set min time 59
execute if score sec time matches -1 run scoreboard players remove min time 1
execute if score sec time matches -1 run scoreboard players set sec time 59
execute if score tick time matches -1 run scoreboard players remove sec time 1
execute if score tick time matches -1 run scoreboard players set tick time 19
execute if score running time matches 1 if score pausednoplayer time matches 0 run scoreboard players remove tick time 1

# Boss bar displays with leading zeros
execute if score hour time matches ..0 if score min time matches ..0 if score sec time matches ..0 run bossbar set timer name [{"text":"0","color":"green","bold":true}]

execute if score hour time matches ..0 if score min time matches ..0 if score sec time matches 1..9 run bossbar set timer name [{"text":"0","color":"green","bold":true},{"score":{"name":"sec","objective":"time"},"color":"green","bold":true}]
execute if score hour time matches ..0 if score min time matches ..0 if score sec time matches 10.. run bossbar set timer name [{"score":{"name":"sec","objective":"time"},"color":"green","bold":true}]

execute if score hour time matches ..0 if score min time matches 1..9 if score sec time matches ..9 run bossbar set timer name [{"text":"0","color":"green","bold":true},{"score":{"name":"min","objective":"time"},"color":"green","bold":true},{"text":":","bold":true},{"text":"0","color":"green","bold":true},{"score":{"name":"sec","objective":"time"},"color":"green","bold":true}]
execute if score hour time matches ..0 if score min time matches 1..9 if score sec time matches 10.. run bossbar set timer name [{"text":"0","color":"green","bold":true},{"score":{"name":"min","objective":"time"},"color":"green","bold":true},{"text":":","bold":true},{"score":{"name":"sec","objective":"time"},"color":"green","bold":true}]
execute if score hour time matches ..0 if score min time matches 10.. if score sec time matches ..9 run bossbar set timer name [{"score":{"name":"min","objective":"time"},"color":"green","bold":true},{"text":":","bold":true},{"text":"0","color":"green","bold":true},{"score":{"name":"sec","objective":"time"},"color":"green","bold":true}]
execute if score hour time matches ..0 if score min time matches 10.. if score sec time matches 10.. run bossbar set timer name [{"score":{"name":"min","objective":"time"},"color":"green","bold":true},{"text":":","bold":true},{"score":{"name":"sec","objective":"time"},"color":"green","bold":true}]

execute if score hour time matches 1..9 if score min time matches ..9 if score sec time matches ..9 run bossbar set timer name [{"text":"0","color":"green","bold":true},{"score":{"name":"hour","objective":"time"},"color":"green","bold":true},{"text":":","bold":true},{"text":"0","color":"green","bold":true},{"score":{"name":"min","objective":"time"},"color":"green","bold":true},{"text":":","bold":true},{"text":"0","color":"green","bold":true},{"score":{"name":"sec","objective":"time"},"color":"green","bold":true}]
execute if score hour time matches 1..9 if score min time matches ..9 if score sec time matches 10.. run bossbar set timer name [{"text":"0","color":"green","bold":true},{"score":{"name":"hour","objective":"time"},"color":"green","bold":true},{"text":":","bold":true},{"text":"0","color":"green","bold":true},{"score":{"name":"min","objective":"time"},"color":"green","bold":true},{"text":":","bold":true},{"score":{"name":"sec","objective":"time"},"color":"green","bold":true}]
execute if score hour time matches 1..9 if score min time matches 10.. if score sec time matches ..9 run bossbar set timer name [{"text":"0","color":"green","bold":true},{"score":{"name":"hour","objective":"time"},"color":"green","bold":true},{"text":":","bold":true},{"score":{"name":"min","objective":"time"},"color":"green","bold":true},{"text":":","bold":true},{"text":"0","color":"green","bold":true},{"score":{"name":"sec","objective":"time"},"color":"green","bold":true}]
execute if score hour time matches 1..9 if score min time matches 10.. if score sec time matches 10.. run bossbar set timer name [{"text":"0","color":"green","bold":true},{"score":{"name":"hour","objective":"time"},"color":"green","bold":true},{"text":":","bold":true},{"score":{"name":"min","objective":"time"},"color":"green","bold":true},{"text":":","bold":true},{"score":{"name":"sec","objective":"time"},"color":"green","bold":true}]

execute if score hour time matches 10.. if score min time matches ..9 if score sec time matches ..9 run bossbar set timer name [{"score":{"name":"hour","objective":"time"},"color":"green","bold":true},{"text":":","bold":true},{"text":"0","color":"green","bold":true},{"score":{"name":"min","objective":"time"},"color":"green","bold":true},{"text":":","bold":true},{"text":"0","color":"green","bold":true},{"score":{"name":"sec","objective":"time"},"color":"green","bold":true}]
execute if score hour time matches 10.. if score min time matches ..9 if score sec time matches 10.. run bossbar set timer name [{"score":{"name":"hour","objective":"time"},"color":"green","bold":true},{"text":":","bold":true},{"text":"0","color":"green","bold":true},{"score":{"name":"min","objective":"time"},"color":"green","bold":true},{"text":":","bold":true},{"score":{"name":"sec","objective":"time"},"color":"green","bold":true}]
execute if score hour time matches 10.. if score min time matches 10.. if score sec time matches ..9 run bossbar set timer name [{"score":{"name":"hour","objective":"time"},"color":"green","bold":true},{"text":":","bold":true},{"score":{"name":"min","objective":"time"},"color":"green","bold":true},{"text":":","bold":true},{"text":"0","color":"green","bold":true},{"score":{"name":"sec","objective":"time"},"color":"green","bold":true}]
execute if score hour time matches 10.. if score min time matches 10.. if score sec time matches 10.. run bossbar set timer name [{"score":{"name":"hour","objective":"time"},"color":"green","bold":true},{"text":":","bold":true},{"score":{"name":"min","objective":"time"},"color":"green","bold":true},{"text":":","bold":true},{"score":{"name":"sec","objective":"time"},"color":"green","bold":true}]
