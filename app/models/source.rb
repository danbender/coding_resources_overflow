class Source < ActiveRecord::Base
  attr_accessible :title, :url, :tag_list
  validates :title, presence: true, uniqueness: true
  validates :url, presence: true

  acts_as_taggable_on :tags

  has_many :comments
end