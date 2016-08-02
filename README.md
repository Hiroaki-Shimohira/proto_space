== README
#prototype

##association
- has_many :capture_images, likes, comments  
- belongs_to :user  

##culumns
- title  
- catchcopy  
- concept  
- user_id  

#comment

##association
- belogs_to :user, prototype  

##culumns
- content  
- user_id  
- prototype_id  

#capture_image

##association
- belongs_to :prototype  

##culumns
- image  
- prototype_id  
- status  

#like

##association
- belongs_to :prototype, :user  

##culumns
- user_id  
- prototype_id  

#user

##association
- has_many :prototypes, comments, likes  

##culumns
- member  
- profile  
- works  
- avator  
- email  
- password  
- nickname  

