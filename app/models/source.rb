class Source < ActiveRecord::Base
  attr_accessible :title, :url, :tag_list
  validates :title, presence: true, uniqueness: true
  validates :url, presence: true

  act_as_taggable

  has_many :comments
end