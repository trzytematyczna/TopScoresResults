
#!/bin/bash
set v
set x
i=1
while [ $i -lt 66 ]
do 
echo "\copy (select author_id, score from pi_scores where slot_no = ${i} and islink =0 order by score desc limit 10) to 'pi_comments_top10_slot_${i}.csv' with CSV"
psql -U postgres -d huffington -c "\copy (select author_id, score from pi_scores where slot_no = ${i} and islink =0 order by score desc limit 10) to 'pi_comments_top10_slot_${i}.csv' with CSV" 
let i=i+1
done



