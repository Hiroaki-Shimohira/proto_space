class CreateCaptureImages < ActiveRecord::Migration
  def change
    create_table :capture_images do |t|
    	t.text :image
    	t.integer :prototype_id
    	t.integer :status

      t.timestamps
    end
  end
end
