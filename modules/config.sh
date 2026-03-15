#!/bin/bash

echo "Updating cs2server.cfg settings..."

CFG_DIR="/home/cs2server/serverfiles/game/csgo/cfg"
CS2SERVER_CFG="$CFG_DIR/cs2server.cfg"
MAPCYCLE="/home/cs2server/serverfiles/game/csgo/mapcycle.txt"

mkdir -p "$CFG_DIR"

########################################
# Update hostname and maxplayers
########################################

# Update hostname to SERVER_NAME if set, otherwise default
if [ -n "$SERVER_NAME" ]; then
    sed -i "s/^hostname .*/hostname \"$SERVER_NAME\"/" "$CS2SERVER_CFG"
else
    sed -i "s/^hostname .*/hostname \"LinuxGSM\"/" "$CS2SERVER_CFG"
fi

# Update maxplayers to 10, add line if missing
if grep -q "^maxplayers" "$CS2SERVER_CFG"; then
    sed -i "s/^maxplayers .*/maxplayers 10/" "$CS2SERVER_CFG"
else
    echo "maxplayers 10" >> "$CS2SERVER_CFG"
fi

########################################
# mapcycle.txt
########################################

if [ ! -f "$MAPCYCLE" ]; then
    echo "Creating mapcycle.txt"
    cat <<EOF > "$MAPCYCLE"
de_mirage
de_dust2
de_inferno
de_nuke
de_ancient
de_anubis
de_overpass
de_vertigo
EOF
else
    echo "mapcycle.txt already exists. Skipping."
fi

########################################
# Permissions
########################################

chown cs2server:cs2server "$CS2SERVER_CFG" "$MAPCYCLE"

echo "cs2server.cfg updated successfully."