--dla przeliczonych id, liczba_ile_razy_byl_w_topie, statystyka ile jest takich osob ktore mialy taka liczbe liczba_ile_razy_byl_w_topie

\copy (select foo.cnt as count_slots, count(*) as how_many_users  from (select author_id, count(*) as cnt from pi_top10 where islink_val=0 group by author_id order by count(*) desc) as foo group by foo.cnt order by foo.cnt desc) to 'pi_comments_sum.csv' with csv HEADER;

\copy (select foo.cnt as count_slots, count(*) as how_many_users  from (select author_id, count(*) as cnt from pi_top10 where islink_val=1 group by author_id order by count(*) desc) as foo group by foo.cnt order by foo.cnt desc) to 'pi_comments_links_sum.csv' with csv HEADER;

\copy (select foo.cnt as count_slots, count(*) as how_many_users  from (select author_id, count(*) as cnt from agarwal_top10 where mode='avg' group by author_id order by count(*) desc) as foo group by foo.cnt order by foo.cnt desc) to 'agarwal_avg_sum.csv' with csv HEADER;
\copy (select foo.cnt as count_slots, count(*) as how_many_users  from (select author_id, count(*) as cnt  from agarwal_top10 where mode='max' group by author_id order by count(*) desc) as foo group by foo.cnt order by foo.cnt desc) to 'agarwal_max_sum.csv' with csv HEADER;


\copy (select foo.cnt as count_slots, count(*) as how_many_users  from (select author_id, count(*) as cnt  from erinaki_top10 where links_only=true group by author_id order by count(*) desc) as foo group by foo.cnt order by foo.cnt desc) to 'erinaki_links_sum.csv' with csv HEADER;
\copy (select foo.cnt as count_slots, count(*) as how_many_users  from (select author_id, count(*) as cnt  from erinaki_top10 where links_only=false group by author_id order by count(*) desc) as foo group by foo.cnt order by foo.cnt desc) to 'erinaki_links_comment_sum.csv' with csv HEADER;
