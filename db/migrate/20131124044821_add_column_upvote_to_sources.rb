class AddColumnUpvoteToSources < ActiveRecord::Migration
  def change
    add_column :sources, :upvote_count, :integer
  end
end
