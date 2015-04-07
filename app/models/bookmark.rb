class Bookmark < ActiveRecord::Base
  belongs_to :topic
  has_many :likes
end
