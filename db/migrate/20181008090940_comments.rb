class Comments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.integer :article_id, null: false
      t.string :name, null: false
      
      t.timestamps
    end

    add_index :comments, :article_id
  end
end
