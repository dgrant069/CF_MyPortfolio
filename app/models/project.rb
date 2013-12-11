class Project < ActiveRecord::Base
  attr_accessible :name,
                  :tech_used,
                  :description,
                  :http_link,
                  :published,
                  :content,
                  :image,
                  :remote_image_url,
                  :image_processed

  validates :name, length: { in: 4..225 }
  #validates :tech_used, presence: true

  belongs_to :author, class_name: "User"

  mount_uploader :image, ImageUploader

  has_many :comments, as: :commentable

  after_save :enqueue_image

  def publish!
    published = true
    save!
  end

  def image_name
    File.basename(image.path || image.filename) if image
  end

  def enqueue_image
    ImageWorker.perform_async(id, key) if key.present?
  end

  class ImageWorker
    include Sidekiq::Worker

    def perform(id, key)
      project = Project.find(id)
      project.key = key
      project.remote_image_url = project.image.direct_fog_url(with_path: true)
      project.save!
      project.update_column(:image_processed, true)
    end
  end
end
