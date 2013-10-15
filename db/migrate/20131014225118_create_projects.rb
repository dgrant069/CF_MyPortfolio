class CreateProjects < ActiveRecord::Migration
  #include ActiveModel::Validations


  def change
    create_table :projects do |t|
      t.string :name
      t.text :tech_used

      t.timestamps
    end
  end
end
