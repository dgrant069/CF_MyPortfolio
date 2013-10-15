class CreateProjects < ActiveRecord::Migration
  #include ActiveModel::Validations
    validates :name, length: { in: 4..225 }
    validates :tech_used, presence: true

  def change
    create_table :projects do |t|
      t.string :name
      t.text :tech_used

      t.timestamps
    end
  end
end
