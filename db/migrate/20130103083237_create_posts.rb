class CreatePosts < ActiveRecord::Migration
  def change
  	create_table :posts do |t|
  		t.string :title
  		t.integer :price
  		t.string :description
  		t.string :url

  		t.timestamps
  	end
  end
end
