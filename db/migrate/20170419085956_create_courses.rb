class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :title, null: false
      t.text :description
      t.integer :repo_id, limit: 8, null: false
      t.string :repo_slug, null: false
      t.string :repo_url, null: false

      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :courses, :repo_id, unique: true
  end
end
