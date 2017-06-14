class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :name_en
      t.string :name_ch
      t.text :description

      t.timestamps
    end
  end
end
