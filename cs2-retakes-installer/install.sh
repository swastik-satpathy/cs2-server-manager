#!/bin/bash

set -euo pipefail

LOG="/var/log/cs2-installer.log"

exec > >(tee -a $LOG)
exec 2>&1

echo "Starting CS2 Retakes Installer"

read -p "Enter GSLT Token: " GSLT
read -p "Server Owner SteamID: " OWNER_STEAMID

export GSLT
export OWNER_STEAMID

if ! id "cs2server" &>/dev/null; then
    useradd -m cs2server
fi

cd "$(dirname "$0")"

source modules/dependencies.sh
source modules/lgsm.sh
source modules/metamod.sh
source modules/cssharp.sh
source modules/database.sh
source modules/cron.sh

echo "Installation complete"