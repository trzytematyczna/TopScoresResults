
#!/bin/bash
set v
set x
i=1
while [ $i -lt 66 ]
do 
echo "\copy (select author_id, avg_val from agarwal_scores where slot_no = ${i} order by avg_val desc limit 10) to 'agarwal_avg_top10_slot_${i}.csv' with CSV"
psql -U postgres -d huffington -c "\copy (select author_id, avg_val from agarwal_scores where slot_no = ${i} order by avg_val desc limit 10) to 'agarwal_avg_top10_slot_${i}.csv' with CSV" 
let i=i+1
done



