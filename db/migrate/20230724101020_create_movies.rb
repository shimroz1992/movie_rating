class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.integer :movie_year
      t.string :director
      t.string :actor
      t.string :filming_location
      t.string :country

      t.timestamps
    end
  end
end
