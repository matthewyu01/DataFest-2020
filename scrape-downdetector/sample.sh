#!/bin/sh

print_usage_and_exit() {
    printf "Usage: %s <company>\n" "$0" && exit 2
}

[ $# -eq 1 ] || print_usage_and_exit

FILE="../data/$1-outages.csv"
echo "processing 2020-05" && node index.js "$1" 2020 05 >> "$FILE" && sleep 2
echo "processing 2020-04" && node index.js "$1" 2020 04 >> "$FILE" && sleep 2
echo "processing 2020-03" && node index.js "$1" 2020 03 >> "$FILE" && sleep 2
echo "processing 2020-02" && node index.js "$1" 2020 02 >> "$FILE" && sleep 2
echo "processing 2020-01" && node index.js "$1" 2020 01 >> "$FILE" && sleep 2
echo "processing 2019-12" && node index.js "$1" 2019 12 >> "$FILE" && sleep 2
echo "processing 2019-11" && node index.js "$1" 2019 11 >> "$FILE" && sleep 2
echo "processing 2019-10" && node index.js "$1" 2019 10 >> "$FILE" && sleep 2
echo "processing 2019-09" && node index.js "$1" 2019 09 >> "$FILE" && sleep 2
echo "processing 2019-08" && node index.js "$1" 2019 08 >> "$FILE" && sleep 2
echo "processing 2019-07" && node index.js "$1" 2019 07 >> "$FILE" && sleep 2
echo "processing 2019-06" && node index.js "$1" 2019 06 >> "$FILE" && sleep 2
echo "processing 2019-05" && node index.js "$1" 2019 05 >> "$FILE" && sleep 2
echo "processing 2019-04" && node index.js "$1" 2019 04 >> "$FILE" && sleep 2
echo "processing 2019-03" && node index.js "$1" 2019 03 >> "$FILE" && sleep 2
echo "processing 2019-02" && node index.js "$1" 2019 02 >> "$FILE" && sleep 2
echo "processing 2019-01" && node index.js "$1" 2019 01 >> "$FILE" && sleep 2 