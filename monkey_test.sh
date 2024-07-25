#!/bin/bash

log_directory="./logs"

if [ ! -d "$log_directory" ]; then
mkdir -p "$log_directory"
echo "Created log directory: $log_directory"
fi

while true; do

    current_datetime=$(date +"%Y-%m-%d_%H%M%S")
    log_file="${log_directory}/${current_datetime}.log"

    echo "Starting monkey_test application..." >> "$log_file"
    node bin/dev.js monkey -i 1800-7200 -r https://5b4522f4.vaughnmedellins394.myterminus.com -a 2-4 -p ab1144211deab0fca23ce83b87b66368fddda770783a61bbdb738ee46e9eef38 -s 0x9403143452e5546ddf4eb3e8a286a62d698000de0760c3927e72a1a96228782efee69ce6840ffcc48af425d5827e8dbcb1a9afd688ef206ee3da5c9ef23503dc -t "succeed,refund,cheat amount,cheat address,cheat txin" -C true -n testnet -T 0x945e9704D2735b420363071bB935ACf2B9C4b814 -S 0xfee69ce6840ffcc48af425d5827e8dbcb1a9afd688ef206ee3da5c9ef23503dc -w http://n8n.edge-dev.xyz/webhook/f8b3f611-89b9-4128-8e93-b50ff7003530 -b "" -c "{\"opt\": \"https://sepolia.optimism.io\"}" -l "vaughnmedellins394.myterminus.com" >> "$log_file" 2>&1
    
    echo "Monkey_test application exited with code $?. Restarting..." >> "$log_file"
    
    sleep 1

done