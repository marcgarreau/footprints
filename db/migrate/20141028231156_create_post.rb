class CreatePost < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user
      
      t.timestamps
    end
  end
end
