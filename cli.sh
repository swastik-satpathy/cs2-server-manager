#!/bin/bash

# Use SCRIPT_DIR from parent script, fallback to current directory
SCRIPT_DIR="${SCRIPT_DIR:-.}"

# Load environment configuration (cascade through multiple locations)
if [ -f "$SCRIPT_DIR/.env" ]; then
    echo "Loading configuration from $SCRIPT_DIR/.env"
    set -a
    source "$SCRIPT_DIR/.env"
    set +a

elif [ -f "$SCRIPT_DIR/../.env" ]; then
    echo "Loading configuration from $SCRIPT_DIR/../.env"
    set -a
    source "$SCRIPT_DIR/../.env"
    set +a

elif [ -f "$HOME/.cs2servermanager.env" ]; then
    echo "Loading configuration from $HOME/.cs2servermanager.env"
    set -a
    source "$HOME/.cs2servermanager.env"
    set +a
fi

ask_if_empty() {
    VAR=$1
    QUESTION=$2

    if [ -z "${!VAR:-}" ]; then
        read -rp "$QUESTION: " VALUE
        export $VAR="$VALUE"
    fi
}

ask_if_empty GSLT "Steam GSLT Token"
ask_if_empty SERVER_NAME "Server Name"
ask_if_empty SERVER_TAGS "Server Tags"
# ask_if_empty OWNER_STEAMID "Owner SteamID"
# ask_if_empty ADMINS "Admin SteamIDs (comma separated)"
# ask_if_empty WEBHOOK "Discord Webhook URL (optional)"