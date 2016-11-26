class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :subject
      t.integer :course_number
      t.string :description
      t.belongs_to :school, foreign_key: true

      t.timestamps
    end
  end
end
