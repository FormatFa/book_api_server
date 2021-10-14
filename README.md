小程序在线书城 - 后端API接口

书城API接口：https://gitee.com/FormatFa/it_book
书城小程序： https://gitee.com/FormatFa/itbook_mini
书本后台管理(基于若依管理系统): https://gitee.com/FormatFa/it_book_manage

功能:
- [x] 书本收藏，列表，
- [x] 微信登录
- [x] 购买章节


TOOD:
- [ ] 分类管理
- [ ] 书本简介

### Quickly Start
#### 普通启动
- 设置微信小程序环境变量
  export WECHAT_MINI_APPID=xxx
  export WECHAT_MINI_SECRET=yyy
#### Docker-Compose
环境变量设置：
vi deploy/docker/book_api_server.env
docker-compose up -d
