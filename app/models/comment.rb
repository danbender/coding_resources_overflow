class Comment < ActiveRecord::Base
  attr_accessible :body

  belongs_to :source
end