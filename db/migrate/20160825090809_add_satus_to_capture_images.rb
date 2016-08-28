class AddSatusToCaptureImages < ActiveRecord::Migration
  def change
    add_column :capture_images, :satus, :integer, default: 0
  end
end
