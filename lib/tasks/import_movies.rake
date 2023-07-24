# lib/tasks/import_movies.rake

require 'csv'

namespace :import do
  desc "Import movies from CSV file"
  task movies: :environment do
    file_path = 'public/temp_csv/movies.csv'  # Replace with the actual path to your CSV file

    CSV.foreach(file_path, headers: true) do |row|
      movie = Movie.new(
        title: row['Movie'],
        description: row['Description'],
        movie_year: row['Year'],
        director: row['Director'],
        actor: row['Actor'],
        filming_location: row['Filming location'],
        country: row['Country']
      )

      if movie.save
        puts "Movie '#{movie.title}' saved successfully."
      else
        puts "Error saving movie '#{movie.title}': #{movie.errors.full_messages.join(', ')}"
      end
    end
  end
end
