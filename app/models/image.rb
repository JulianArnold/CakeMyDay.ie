class Image < ActiveRecord::Base
  attr_accessible :base_product, :bucket_name, :content_type, :file_name, :file_size, :finished_product, :uploaded_by
  
  belongs_to  :creator,
              :class_name => "User",
              :foreign_key => "uploaded_by"
  has_many    :product_images
  
  def full_file_path
    # needs some more work - to include the root URL
    return bucket_name + "/" + file_name
  end
  
end
