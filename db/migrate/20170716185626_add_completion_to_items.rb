class AddCompletionToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :completion, :boolean, default: false
  end
end
