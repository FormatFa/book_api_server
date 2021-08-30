book
	- id
	- name
	- author
	- category
	- status 
	- word_count

book_tags 书本标签

	- book_id
	- tag 
	primary_key(book_id,tag)
	foreign_key book.book_id


book_shelf 书架
	- id
	- user_id
	- book_id
	- add_time

	F

分类表（二级）
book_category
	id
	parent_id
	category



各类分类表



书本图片集成？阿里云eos?

route:

- 查找所有分类