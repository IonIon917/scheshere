# Users
|Clumn    |Type      |Options                     |
|---------|----------|----------------------------|
|email    |string    |unique                      |
|nickname |string    |null:false                  |
|password |string    |null:false 4文字以上          |
|group    |references|foreign_key:true, null:false|
|calender |references|foreign_key:true, null:false|




## Association


# Calender
|Clumn    |Type      |Options                     |
|---------|----------|----------------------------|
|title    |string    |null:false                  |
|item     |integer   |null:false                  |
|place    |string    |null:false                  |
|content  |string    |                            |
|user     |references|foreign_key:true, null:false|
|group    |references|foreign_key:true, null:false|



## Association

# Group
|Clumn    |Type      |Options                     |
|---------|----------|----------------------------|
|groupName|string    |null:false                  |
|groupID  |string    |null:false unique 8文字以上   |
|user     |references|foreign_key:true, null:false|
|calender |references|foreign_key:true, null:false|

## Association
