class Project < ActiveRecord::Base
  attr_accessible :name,
                  :tech_used,
                  :published,
                  :content

  validates :name, length: { in: 4..225 }
  validates :tech_used, presence: true

  belongs_to :author, class_name: "User"

  has_many :comments, as: :commentable

  def publish!
    published = true
    save!
  end

end
