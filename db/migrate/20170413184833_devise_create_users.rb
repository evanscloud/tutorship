# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      # Basic info
      t.string :name
      t.string :email
      t.string :location
      t.string :login, null: false

      # GitHub info
      t.integer :github_id, limit: 8, null: false
      t.string :avatar_url, null: false
      t.string :github_url, null: false
      t.string :github_token, null: false

      # For created_at & updated_at
      t.timestamps null: false
    end

    add_index :users, :login, unique: true
    add_index :users, :github_id, unique: true
  end
end
