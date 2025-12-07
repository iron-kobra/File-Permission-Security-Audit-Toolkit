#!/bin/bash

MODULE_DIR="./modules"
OUTPUT_DIR="./output"

if [ -e logs.log ]; then
    logs="logs.log"
else
    touch logs.log
    logs="logs.log"
fi

# Colors for pretty CLI
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
NC="\e[0m"

help_menu() {
    echo "#############################################################"
    echo "                Security Audit Toolkit"
    echo "#############################################################"
    echo ""
    echo "Usage: $0 [option]"
    echo ""
    echo "Options:"
    echo "  all                Run full audit"
    echo "  insecure           Scan insecure permissions"
    echo "  world-writable     Find world-writable files"
    echo "  weak-scripts       Analyze weak/risky scripts"
    echo "  broken-links       Check for broken symbolic links"
    echo "  recommendations    Show system recommendations"
    echo "  report             Show final Report"
    echo "  quit               Quit"
    echo ""
}

ensure_directories() {
    mkdir -p "$OUTPUT_DIR"
}
show_output(){
 while read line
 do
	echo $line
 done < "$OUTPUT_DIR/$1.txt"
}
run_module() {
    script="$MODULE_DIR/$1.sh"

    if [ -f "$script" ]; then
        echo -e "${YELLOW}Running $1 module...${NC}"
        echo -e "$(date) - Running $1...\n" >> "$logs"
        bash "$script"
        echo -e "${GREEN}Completed: $1${NC}\n"
        echo -e "$(date) - Exiting $1...\n" >> "$logs"
    else
        echo -e "${RED}Module $1 not found!${NC}"
        echo -e "$(date) - Failed to load $1\n" >> "$logs"
        exit 1
    fi
}
while true 
do
help_menu
read -p "Enter you choice:" choice
case $choice in
    insecure)
        ensure_directories
        run_module "insecure_permissions"
	show_output "insecure_permissions"
        ;;
    world-writable)
        ensure_directories
        run_module "world_writable"
	show_output "world_writable"
        ;;
    weak-scripts)
        ensure_directories
        run_module "weak_script_detector"
	show_output "weak_script_report"
        ;;
    broken-links)
        ensure_directories
        run_module "broken_links"
	show_output "broken_links"
        ;;
    recommendations)
        ensure_directories
	run_module "recommendations"
	show_output "recommendations"
        ;;
    report)
        ensure_directories
        run_module "report_generator"
	show_output "audit_report"
        ;;
    all)
        ensure_directories
        run_module "insecure_permissions"
        run_module "world_writable"
        run_module "weak_script_detector"
        run_module "broken_links"
        run_module "recommendations"
        run_module "report_generator"
	show_output "recommendations"
	show_output "audit_report"
        ;;
    quit|Quit)
	echo "thank you for using our toolkit"
	echo "exiting.."
	exit 0
	;;
    *)
        echo -e "${RED}Invalid option.${NC}"
    	echo "exiting..."
	exit 0
        ;;
esac
done
