#!/bin/bash

while true; do
    echo "======================================"
    echo "        SYSTEM TOOLKIT MENU"
    echo "======================================"
    echo "1. User Info"
    echo "2. Disk & Memory Check"
    echo "3. Process Manager"
    echo "4. File Organizer"
    echo "5. Network Info"
    echo "6. Exit"
    echo "======================================"
    read -p "Enter your choice: " choice

    case $choice in

        1)
            echo "------ USER INFO ------"
            echo "Username: $USER"
            echo "Home Directory: $HOME"
            echo "Current Shell: $SHELL"
            echo "-----------------------"
            ;;

        2)
            echo "------ DISK & MEMORY CHECK ------"
            echo "Disk Usage:"
            df -h
            echo
            echo "Memory Info:"
            free -h
            echo "----------------------------------"
            ;;

        3)
            echo "------ PROCESS MANAGER ------"
            echo "Top processes:"
            ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head
            echo
            read -p "Enter PID to kill (or 0 to skip): " pid
            if [ "$pid" -ne 0 ]; then
                kill $pid 2>/dev/null
                if [ $? -eq 0 ]; then
                    echo "Process $pid terminated successfully."
                else
                    echo "Failed to terminate process. Check PID and permissions."
                fi
            else
                echo "Skipping kill operation."
            fi
            echo "------------------------------"
            ;;

        4)
            echo "------ FILE ORGANIZER ------"
            backup_dir="backup_files"
            mkdir -p "$backup_dir"
            mv *.log *.txt "$backup_dir" 2>/dev/null
            echo "All .log and .txt files moved to '$backup_dir' directory."
            echo "--------------------------------"
            ;;

        5)
            echo "------ NETWORK INFO ------"
            echo "IP Address:"
            ip addr | grep "inet "
            echo
            echo "Active Network Interfaces:"
            ip link show | grep "state UP" -A1
            echo
            read -p "Enter website to ping: " site
            ping -c 4 "$site"
            echo "---------------------------"
            ;;

        6)
            echo "Exiting... Goodbye!"
            exit 0
            ;;

        *)
            echo "Invalid choice! Please enter a number between 1–6."
            ;;
    esac

    echo
    read -p "Press Enter to return to menu..."
done
