delete from book;
insert into book(name,author,category,status,word_count) values("拒嫁豪门","西门吹雪",101,"",10);
insert into book(name,author,category,status,word_count) values("限时复婚","云中飞燕",101,"",10);
insert into book(name,author,category,status,word_count) values("南风过境，你我皆客","",102,"",10);
insert into book(name,author,category,status,word_count) values("武道大帝","忘情至尊",201,"",10);
insert into book(name,author,category,status,word_count) values("天师神像","北冥小妖",201,"",10);

select * from book_category where parent_id=1;
-- find all books that belong to a big category
select * from book where category in (select id from book_category where parent_id=1) ;