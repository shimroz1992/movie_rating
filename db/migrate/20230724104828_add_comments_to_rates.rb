class AddCommentsToRates < ActiveRecord::Migration[7.0]
  def change
    add_column :rates, :comments, :text
  end
end
