class Post < ActiveRecord::Base
  attr_accessible :body, :title, :created_at
  belongs_to :author, class_name: "User"

end
