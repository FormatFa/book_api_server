mysql的表迁移到postgre
pgloader  --verbose  mysql://root@193.168.10.2/book  pgsql://book:book@193.168.10.5/book
pgloader  --verbose  mysql://root@193.168.10.2/book  pgsql://otjtjlwzqkzxgu:bd381755bff80389a0743b0e47687d43e150c358a0fcea6672290d82e4ebbe8b@ec2-54-172-169-87.compute-1.amazonaws.com/dce0rjkkorf0mo


pg_dump -U book book>book.pgsql
psql -h ec2-54-172-169-87.compute-1.amazonaws.com  -U otjtjlwzqkzxgu -d dce0rjkkorf0mo  < book.pgsql