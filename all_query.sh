#! bin/bash

# Execute sql case by case rawly
# Please modify the path of `.sql` files

if [ $# -ne 5 ]; then
  echo "$0 host user password db port"
  exit
fi

host=$1
user=$2
password=$3
db=$4
port=$5

querys="1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22"
for query in $querys; do
  echo -n query $query": "
  'time' -f "%e" psql -h $host -U $user -w -p $port -d $db -f ./query_root/perf_query_gen/${query}.sql > /dev/null
  # echo "'time' -f \"%e\" psql -h $host -U $user -w -p $port -d $db -f ./data/${query}.sql > /dev/null"
done
