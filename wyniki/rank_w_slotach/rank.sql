\copy (select author_id, slot_no, score from  pi_scores where islink=0 and author_id in (select author_id from pi_top10 where islink_val=0 group by author_id order by count(*) desc limit 5) order by author_id,slot_no) to 'pi_comments_user_slot_scores.csv' with csv HEADER;
\copy (select author_id, slot_no, score from  pi_scores where islink=1 and author_id in (select author_id from pi_top10 where islink_val=1 group by author_id order by count(*) desc limit 5) order by author_id,slot_no) to 'pi_comments_links_user_slot_scores.csv' with csv HEADER;

\copy (select author_id, slot_no, avg_val from agarwal_scores where author_id in (select author_id from agarwal_top10 where mode='avg' group by author_id order by count(*) desc limit 5) order by author_id,slot_no)  to 'agarwal_avg_user_slot_scores.csv' with csv HEADER;
\copy (select author_id, slot_no, max_val from agarwal_scores where author_id in (select author_id from agarwal_top10 where mode='max' group by author_id order by count(*) desc limit 5) order by author_id,slot_no) to 'agarwal_max_user_slot_scores.csv' with csv HEADER;


\copy (select varid, slot_no, erinaki_score from erinaki_slot_scores where links_only = true and generation = 1 and varid in (select author_id from erinaki_top10 where links_only=true group by author_id order by count(*) desc limit 5) order by varid,slot_no) to 'erinaki_links_user_slot_scores.csv' with csv HEADER;
\copy (select varid, slot_no, erinaki_score from erinaki_slot_scores where links_only = false and generation = 1 and varid in (select author_id from erinaki_top10 where links_only=false group by author_id order by count(*) desc limit 5) order by varid,slot_no) to 'erinaki_links_comment_user_slot_scores.csv' with csv HEADER;
