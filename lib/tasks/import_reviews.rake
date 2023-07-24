# lib/tasks/import_movies.rake

require 'csv'

namespace :import do
  desc "Import movies and reviews from CSV file"
  task import_reviews: :environment do
    file_path = 'public/temp_csv/reviews.csv'  # Replace with the actual path to your CSV file

    CSV.foreach(file_path, headers: true) do |row|
      movie = Movie.find_or_create_by(title: row['Movie'])
      user = User.find_or_create_by_name(row['User'])
      review = movie.review_rates.build(rater_id: user.id, stars: row['Stars'], comments: row['Review'])
      if review.save
        puts "Movie '#{review.id}' and review saved successfully."
      else
        puts "Error saving movie '#{review.id}': #{review.errors.full_messages.join(', ')}"
      end
    end
  end
end
