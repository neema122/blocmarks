class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  has_many :topics
  has_many :bookmarks, through: :topics
  has_many :likes
  
  def liked(bookmark)
     likes.where(bookmark_id: bookmark.id).first
   end
  
  def liked_bookmarks
    #likes.collect {|like| like.bookmark}
    likes.collect(&:bookmark)
  end
end
