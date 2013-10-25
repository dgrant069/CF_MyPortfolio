class Project < ActiveRecord::Base
  attr_accessible :name, :tech_used

  validates :name, length: { in: 4..225 }
  validates :tech_used, presence: true

  belongs_to :author, class_name: "User"

  has_many :comments, as: :commentable
end
