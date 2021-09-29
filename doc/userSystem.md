用户系统

需求: 在微信小程序端和web端(暂不考虑) 使用


需要保存的内容:
- 小程序用户openid
- 用户头像(url?) 
- 用户昵称
- email 
- 性别
- 创建时间
- 用户id
- 金币余额

openid  varchar(100)
avatar_url varchar(100)
nickname  varchar(20)
sex tinyint
email varchar(20)
password varchar(60)
coin int 




记录:

登陆事件 
event_login 
userid  username   time   ip


用户密码加密方案:




register by email flow:

- submit : email,password,verify code

body里保存
用户email

jwt authentication

jwt header
jwt body 

书币系统

- 充值记录表
- 消费记录





微信登录:
- 小程序发送code
- code get openid
- according openid , create or login user

- fahui session key


