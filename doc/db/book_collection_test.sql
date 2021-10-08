insert into collection(name) values("newbook");
insert into collection(name) values("hotbook");

insert into book_collection(collection_id,book_id) values(1,1);
insert into book_collection(collection_id,book_id) values(1,2);
insert into book_collection(collection_id,book_id) values(1,3);

insert into book_collection(collection_id,book_id) values(2,3);


select * from collection;