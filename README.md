== README
#prototype
##association
- has_many :capture_images, likes, comments  
- belongs_to :user  
##table
- catchcopy  
- concept  
- user_id  

#comment
##association
- belogs_to :user, prototype  
##table
- content  
- user_id  
- prototype_id  

#capture_image
##association
- belongs_to :prototype  
##table
- prototype_id  
- main_image  
- sub_image  

#likes
##association
- belongs_to :prototype  
##table
- user_id  
- prototype_id

#user
##association
- has_many :prototypes  
- has_many :comments  
##table
- member  
- profile  
- works  
- avator  
- email  
- password  
- nickname  

