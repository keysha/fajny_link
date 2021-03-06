class Link < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :destroy
  attr_accessible :title, :url, :body, :user, :tag_list, :private
  acts_as_taggable_on :tags
  ActsAsTaggableOn::TagList.delimiter = " "

  def self.search(search)
    if search
      where('title LIKE ? or body LIKE ?', "%#{search}%", "%#{search}")
    else
      scoped
    end
  end

end
