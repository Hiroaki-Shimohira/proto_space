== README
#prototype
##association
- has_many :captureimages, likes, coments  
- belongs_to :user
##table
- catchcopy  
- concept  
- user_id  

#coment
##association
- belogs_to :user, prototype,
## table
- content  
- user_id  
- prototype_id

#captureimage
##association
- belongs_to :prototype
##table
- prototype_id

#likes
##association
- belongs_to :prototype
##table
- user_id  
- prototype_id

#user
##association
- has_many :prototypes  
- has_many :coments
##table
- member  
- profile  
- works  
- avator  
- email  
- password  
- nickname  
