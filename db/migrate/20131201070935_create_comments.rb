class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.text :body
      t.belongs_to :source

      t.timestamps
    end
  end

  def down
    drop_table :comments
  end
end
