
#!/bin/bash
set v
set x
i=1
while [ $i -lt 66 ]
do 
echo "\copy (select varid, erinaki_score from erinaki_slot_scores where slot_no = ${i} and generation = 1 and links_only = true order by erinaki_score desc limit 10) to 'erinaki_links_top10_slot_${i}.csv' with CSV"
psql -U postgres -d huffington -c "\copy (select varid, erinaki_score from erinaki_slot_scores where slot_no = ${i} and generation = 1 and links_only = true order by erinaki_score desc limit 10) to 'erinaki_links_top10_slot_${i}.csv' with CSV"
let i=i+1
done



