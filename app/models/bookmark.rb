class Bookmark < ActiveRecord::Base
  belongs_to :topic
  has_many :likes
  
 after_create :set_embedly_url
	
	  private

  #bookmark_controller?
	  def set_embedly_url
        embedly_api = Embedly::API.new :key => ENV['EMBEDLY_KEY'], :user_agent => 'Mozilla/5.0 (compatible; mytestapp/1.0; my@email.com)'
        obj = embedly_api.oembed url: self.url
        Rails.logger.info obj[0].inspect
      self.embedly_url = obj[0].thumbnail_url unless obj[0].blank? || obj[0].thumbnail_url.blank?
      Rails.logger.info ">>>> #{embedly_url}"
      self.save
    end

end
