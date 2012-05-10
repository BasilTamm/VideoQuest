class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :user_id
      t.string :path
      t.text :about

      t.timestamps
    end
  end
end
