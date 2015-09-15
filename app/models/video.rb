class Video < ActiveRecord::Base
  belongs_to :category
  has_many :reviews, -> { order("created_at DESC") }
  validates_presence_of :title, :description

  def self.search_by_title(search_item)
    return [] if search_item.blank?
    where("title LIKE ?", "%#{search_item}%").order("created_at DESC")
  end    
end  