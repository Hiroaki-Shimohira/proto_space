class RenameImageColumnToCaptureImages < ActiveRecord::Migration
  def change
  	rename_column :capture_images, :image, :url
  end
end
