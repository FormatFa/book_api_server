docker build -t ggg/book_api_server .
docker run --network book --ip  193.168.10.3 -p 8010:8010 ggg/book_api_server