class Post < ActiveRecord::Base
  attr_accessible :body, :title, :created_at, :published
  belongs_to :author, class_name: "User"

  def publish!
    published = true
    save!
  end
end
