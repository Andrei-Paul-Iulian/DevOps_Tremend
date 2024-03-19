#!/bin/bash

print_home_directory() {
    awk -F: '{print $6}' /etc/passwd
}

list_usernames() {
    awk -F: '{print $1}' /etc/passwd
}

count_users() {
    awk 'END {print NR}' /etc/passwd
}

find_home_directory() {
    read -p "Enter username: " username
    awk -v user="$username" -F: '$1 == user {print $6}' /etc/passwd
}

list_users_uid_range() {
    awk -F: '$3 >= 1000 && $3 <= 1010 {print $1}' /etc/passwd
}

find_standard_shells() {
    grep -E "/bin/(bash|sh)" /etc/passwd | cut -d: -f1
}

replace_slash() {
    sed 's/\//\\/g' /etc/passwd > new_file
}

print_private_ip() {
    ip addr show | grep -Po 'inet \K[\d.]+'
}

print_public_ip() {
    curl ifconfig.me
}

error_handling() {
    if [ "$(id -u)" -ne 0 ]; then
        echo "Error: This script must be run with root privileges." >&2
        exit 1
    fi
}

error_handling

echo -e "\nTask 1\n"
print_home_directory

echo -e "\nTask 2\n"
list_usernames

echo -e "\nTask 3\n"
count_users

echo -e "\nTask 4\n"
find_home_directory

echo -e "\nTask 5\n"
list_users_uid_range

echo -e "\nTask 6\n"
find_standard_shells

echo -e "\nTask 7\n"
replace_slash

echo -e "\nTask 8\n"
print_private_ip

echo -e "\nTask 9\n"
print_public_ip

echo -e "\n"
