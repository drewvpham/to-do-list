class CreateSharedLists < ActiveRecord::Migration[5.0]
  def change
    create_table :shared_lists do |t|
      t.references :user, foreign_key: true
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end
