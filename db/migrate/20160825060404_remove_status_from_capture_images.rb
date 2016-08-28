class RemoveStatusFromCaptureImages < ActiveRecord::Migration
  def change
    remove_column :capture_images, :status, :integer
  end
end
