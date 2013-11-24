class CreateSourcesTable < ActiveRecord::Migration
  def up
    create_table :sources do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
  end

  def down
    drop_table :sources
  end
end
