#!/bin/bash

log_directory="./logs/monkey2_mainnet"

if [ ! -d "$log_directory" ]; then
    mkdir -p "$log_directory"
    echo "Created log directory: $log_directory"
fi

# Function to get Unix timestamp for a given time
get_timestamp() {
  date -d "$1" +%s
}

while true; do

    current_date=$(date +"%Y-%m-%d")
    current_time=$(date +%s)

    # Set start and end times for today
    work_start_time=$(get_timestamp "$current_date 6:00:00")  # 2:00 PM +8
    work_end_time=$(get_timestamp "$current_date 7:00:00")    # 3:00 PM +8

    if [ $current_time -ge $work_start_time ] && [ $current_time -lt $work_end_time ]; then

        current_datetime=$(date +"%Y-%m-%d_%H%M%S")
        log_file="${log_directory}/${current_datetime}.log"
        echo "Starting monkey_mainnet application..." >> "$log_file"
        node bin/dev.js monkey -i 240-240 -r https://5b4522f4.mariansopsoraj.myterminus.com -a 1000-1000 -p $PRIVATE_KEY -s $SOLANA_PRIVATE_KEY -t "succeed" -C true -n mainnet -T 0x7a2B55Ed56F5E209eCd6cF573B8E6744e8724156 -S 0x1ebe99072470ac9509b268c268b505ca2f3b4fb40baed0b940d4a73b0fc3758c -w http://n8n.edge-dev.xyz/webhook/f8b3f611-89b9-4128-8e93-b50ff7003530 -b "" -c "{\"polygon\": \"https://polygon-rpc.com\"}" -l "ballgcolin.myterminus.com" -d true >> "$log_file" 2>&1
        echo "Monkey_mainnet application exited with code $?. Restarting..." >> "$log_file"
        sleep 1
    else
        echo "$(date +"%Y-%m-%d %H:%M:%S") - Not within the swap window"
        sleep 60
    fi

done