#!/bin/sh

print_usage_and_exit() {
    printf "Usage: %s <company>\n" "$0" && exit 2
}

[ $# -eq 1 ] || print_usage_and_exit

node index.js ../data "$1" 2020 05 && sleep 1
node index.js ../data "$1" 2020 04 && sleep 1
node index.js ../data "$1" 2020 03 && sleep 1
node index.js ../data "$1" 2020 02 && sleep 1
node index.js ../data "$1" 2020 01 && sleep 1
node index.js ../data "$1" 2019 12 && sleep 1
node index.js ../data "$1" 2019 11 && sleep 1
node index.js ../data "$1" 2019 10 && sleep 1
node index.js ../data "$1" 2019 09 && sleep 1
node index.js ../data "$1" 2019 08 && sleep 1
node index.js ../data "$1" 2019 07 && sleep 1
node index.js ../data "$1" 2019 06 && sleep 1
node index.js ../data "$1" 2019 05 && sleep 1
node index.js ../data "$1" 2019 04 && sleep 1
node index.js ../data "$1" 2019 03 && sleep 1
node index.js ../data "$1" 2019 02 && sleep 1
node index.js ../data "$1" 2019 01 && sleep 1
