class Source < ActiveRecord::Base
  attr_accessible :title, :url
  validates :title, presence: true, uniqueness: true
  validates :url, presence: true

  has_many :comments
end