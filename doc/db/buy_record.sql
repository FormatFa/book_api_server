SELECT c.chapter_id,c.price, case  when (r.user_id is null and c.price>0) then true else false end as "lock" FROM book_chapter c  left join (select * from buy_record where user_id=1) r on c.chapter_id=r.chapter_id and c.book_id=r.book_id 
where c.book_id=101;
SELECT chapter_id,price FROM book_chapter;
select true from dual;