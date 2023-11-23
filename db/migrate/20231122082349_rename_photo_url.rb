# frozen_string_literal: true

class RenamePhotoUrl < ActiveRecord::Migration[5.2]
  def change
    remove_column :representatives, :photo_url, :string
    add_column :representatives, :photoUrl, :string
  end
end
