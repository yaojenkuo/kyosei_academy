class AddHoursToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :hours, :integer
  end
end
