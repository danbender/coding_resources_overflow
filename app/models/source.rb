class Source < ActiveRecord::Base
  attr_accessible :url, :title
  validates :title, presence: true, uniqueness: true
  validates :url, presence: true
end