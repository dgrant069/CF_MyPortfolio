class Post < ActiveRecord::Base
  attr_accessible :body,
                  :title,
                  :created_at,
                  :published,
                  :content
  belongs_to :author, class_name: "User"
  has_many :comments

  def publish!
    published = true
    save!
  end
end
