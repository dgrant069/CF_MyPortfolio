class Post < ActiveRecord::Base
  attr_accessible :body,
                  :title,
                  :created_at,
                  :published,
                  :published_at,
                  :content

  belongs_to :author, class_name: "User"

  has_many :comments, as: :commentable

  def publish!
    published = true
    save!
  end
end
