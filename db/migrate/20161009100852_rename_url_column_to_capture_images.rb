class RenameUrlColumnToCaptureImages < ActiveRecord::Migration
  def change
  	rename_column :capture_images, :url, :image_url
  end
end
