book
	- id
	- name
	- author
	- category
	- status 
	- word_count
	- chapter_count

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




搜索：
- 通过书名，作者，关键词搜索


书本章节: 
book_chapter:
book-id:
chapter
chapter - title
content: 



已购买的章节表:
book_bought
book_id chapter_id buy_time cost balance





goumai
- 检查余额，修改购买信息，减少余额


书本集合：
用于新书，热门等的集合。
book_collection:
id  集合id字符串 primary_key
book_id 属于集合的书本 primary_key
