class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  attr_accessible :content,
                  :author,
                  :author_url,
                  :author_email,
                  :user_agent,
                  :user_ip,
                  :referrer,

  def approve!
    approved = true
    save!
  end
end
