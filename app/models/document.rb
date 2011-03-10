class Document < ActiveRecord::Base

   attr_accessible :name, :document  
   mount_uploader :document, Documentloader 

end
