#!/usr/bin/env bash

source "${HOME}/.stravauprc"

echo "Watching $QZ_DOCUMENTS_DIRECTORY for changes..."

fswatch -0 "$QZ_DOCUMENTS_DIRECTORY" | while read -d "" event; do
    if [[ "$event" == *.fit && "$event" != *backup* ]]; then
        # Send notification
        echo "New file: $event"
        terminal-notifier -message "New .fit file detected: $event"
        ./stravaup "$event"
    fi
done
