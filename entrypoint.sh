#!/bin/bash
echo "Updating Steam"
steamcmd +force_install_dir /data +login anonymous +app_update 2728330 -beta linuxbranch validate +quit

echo ""
echo ""
echo ""
echo "Game updated, configuring"

export SERVER_NAME="${SERVER_NAME:=HumanitZ [Dedicated]}"
export PASSWORD="${PASSWORD:=}"
export ADMIN_PASS="${ADMIN_PASS:=}"
export MAX_PLAYERS="${MAX_PLAYERS:=16}"
export ONLY_ALLOWED_PLAYERS="${ONLY_ALLOWED_PLAYERS:=0}"
 
export VERSION="${VERSION:=6}"
export SAVE_INTERVAL_SEC="${SAVE_INTERVAL_SEC:=300}"
 
export NO_DEATH_FEEDBACK="${NO_DEATH_FEEDBACK:=0}"
export PERMADEATH="${PERMADEATH:=0}"
export ON_DEATH="${ON_DEATH:=2}"
export CLEAR_INFECTION="${CLEAR_INFECTION:=1}"
 
export PVP="${PVP:=1}"
 
export EAGLE_EYE="${EAGLE_EYE:=1}"
 
export AIR_DROP="${AIR_DROP:=1}"
export AIR_DROP_INTERVAL="${AIR_DROP_INTERVAL:=1}"
 
export WEAPON_BREAK="${WEAPON_BREAK:=1}"
export MULTIPLAYER_SLEEP="${MULTIPLAYER_SLEEP:=0}"
export LOOT_RESPAWN="${LOOT_RESPAWN:=1}"
export LOOT_RESPAWN_TIMER="${LOOT_RESPAWN_TIMER:=60}"
export LOOT_RARITY="${LOOT_RARITY:=2}"
 
export PICKUP_RESPAWN_TIMER="${PICKUP_RESPAWN_TIMER:=90}"
 
export ZOMBIE_DIFF_HEALTH="${ZOMBIE_DIFF_HEALTH:=1}"
export ZOMBIE_DIFF_SPEED="${ZOMBIE_DIFF_SPEED:=2}"
export ZOMBIE_DIFF_DAMAGE="${ZOMBIE_DIFF_DAMAGE:=3}"
export ZOMBIE_RESPAWN_TIMER="${ZOMBIE_RESPAWN_TIMER:=90}"
export ZOMBIE_AMOUNT_MULTI="${ZOMBIE_AMOUNT_MULTI:=1}"
export ZOMBIE_DOG_MULTI="${ZOMBIE_DOG_MULTI:=1}"
 
export HUMAN_DIFFICULTY="${HUMAN_DIFFICULTY:=3}"
export HUMAN_AMOUNT_MULTI="${HUMAN_AMOUNT_MULTI:=1}"
 
export HUMAN_RESPAWN_TIMER="${HUMAN_RESPAWN_TIMER:=90}"
export ANIMAL_RESPAWN_TIMER="${ANIMAL_RESPAWN_TIMER:=90}"
 
export DOG_ENABLED="${DOG_ENABLED:=1}"
export DOG_NUM="${DOG_NUM:=8}"
export RECRUIT_DOG="${RECRUIT_DOG:=1}"
export COMPAINION_HEALTH="${COMPAINION_HEALTH:=1}"
export COMPANION_DMG="${COMPANION_DMG:=1}"
 
export STARTING_SEASON="${STARTING_SEASON:=1}"
export DAYS_PER_SEASON="${DAYS_PER_SEASON:=5}"
export DAY_DUR="${DAY_DUR:=40}"
export NIGHT_DUR="${NIGHT_DUR:=20}"
 
export VITAL_DRAIN="${VITAL_DRAIN:=1}"
 
export BUILDING_HEALTH="${BUILDING_HEALTH:=1}"
 
export ALLOW_DISMANTLE="${ALLOW_DISMANTLE:=1}"
export ALLOW_HOUSE_DISMANTALE="${ALLOW_HOUSE_DISMANTALE:=1}"
 
export TERRITORY="${TERRITORY:=1}"
 
export DECAY="${DECAY:=10080}"
export FOOD_DECAY="${FOOD_DECAY:=1}"
 
export PICKUP_CLEANUP="${PICKUP_CLEANUP:=3000}"
export FAKE_BUILDING_CLEANUP="${FAKE_BUILDING_CLEANUP:=3000}"
 
export GEN_FUEL="${GEN_FUEL:=1}"
export SLEEP="${SLEEP:=1}"

echo "Testing ${GEN_FUEL}"

echo "Testing ${PICKUP_CLEANUP}"

envsubst < /settings.ini > /data/TSSGame/GameServerSettings.ini

echo ""
echo ""
echo "Starting Server"

/data/TSSGame/Binaries/Linux/TSSGameServer-Linux-Shipping TSSGame -log -port=7777 -queryport=27015 -steamservername="$SERVER_NAME"