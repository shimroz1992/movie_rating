# lib/tasks/import_movies.rake

require 'csv'

namespace :import do
  desc "Import movies and reviews from CSV file"
  task import_reviews: :environment do
    file_path = 'public/temp_csv/reviews.csv'  # Replace with the actual path to your CSV file

    CSV.foreach(file_path, headers: true) do |row|
      # review_data = row.to_h.slice('review_comment', 'quality_rating', 'price_rating', 'value_rating')
      # Create or find the movie based on the name
      movie = Movie.find_or_create_by(title: row['Movie'])
      debugger
      user = User.find_or_create_by_name(row['User'])
      # Save the movie and its reviews
      review = movie.review_rates.build(rater_id: User.last.id, stars: row['Stars'], comments: row['Review'])
      if review.save
        puts "Movie '#{review.id}' and review saved successfully."
      else
        puts "Error saving movie '#{review.id}': #{review.errors.full_messages.join(', ')}"
      end
    end
  end
end
