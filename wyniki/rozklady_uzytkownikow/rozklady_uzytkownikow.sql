\copy (select author_id, count(*) from pi_top10 where islink_val=0 group by author_id order by count(*) desc) to 'pi_comments_distr.csv' with csv;
\copy (select author_id, count(*) from pi_top10 where islink_val=1 group by author_id order by count(*) desc) to 'pi_comments_links_distr.csv' with csv;

\copy (select author_id, count(*) from agarwal_top10 where mode='avg' group by author_id order by count(*) desc) to 'agarwal_avg_distr.csv' with csv;
\copy (select author_id, count(*) from agarwal_top10 where mode='max' group by author_id order by count(*) desc) to 'agarwal_max_distr.csv' with csv;


\copy (select author_id, count(*) from erinaki_top10 where links_only=true group by author_id order by count(*) desc) to 'erinaki_links_distr.csv' with csv;
\copy (select author_id, count(*) from erinaki_top10 where links_only=false group by author_id order by count(*) desc) to 'erinaki_links_comment_distr.csv' with csv;
