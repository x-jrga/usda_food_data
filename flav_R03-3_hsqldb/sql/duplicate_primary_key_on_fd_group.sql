select count(*)
from fd_group;
/
select count(distinct(fdgrp_cd))
from fd_group;
/
select fdgrp_cd, count(*) as n
from fd_group
group by fdgrp_cd
order by n desc;
/
