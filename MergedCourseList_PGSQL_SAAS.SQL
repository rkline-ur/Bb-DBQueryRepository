-- Title: MergedCourseList_PGSQL_SAAS
-- Author: Richard Kline (University of Rochester)
-- Version: SaaS
-- Specific Blackboard Database: learn
-- Description: lists Parent and Child courses linked by Bb Merge
-- Display/Output: (optional)
-- Deprecated/Information Only: (optional)
select cmParent.course_id as ParentCourseId
, cmChild.course_id as ChildCourseId
from course_main cmParent 
inner join course_course cc on cc.crsmain_parent_pk1 = cmparent.pk1 
inner join course_main cmChild
on cmChild.pk1 = cc.crsmain_pk1 
-- use line below to specify a specific parent course_id 
-- where cmParent.course_id = [insert course_id]
-- use line below to specify a specific child course_id 
-- where cmChild.course_id = [insert course_id]
-- use line below if it is unkwown whether the course_id is parent or child 
-- where (cmChild.course_id = [insert course_id]) or (cmParent.course_id = [insert course_id])
order by cmParent.course_id, cmChild.course_id
