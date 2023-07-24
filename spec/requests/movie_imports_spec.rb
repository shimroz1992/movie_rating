# spec/tasks/import_movies_spec.rb

require 'rails_helper'
require 'rake'

RSpec.describe 'import_movies' do
  before :all do
    Rails.application.load_tasks  # Load the Rake tasks
  end

  describe 'import:movies' do
    let(:csv_file) { Rails.root.join('spec/fixtures/movies.csv') }

    it 'imports movies from the CSV file' do
      # Run the rake task and check if the Movie count changes
      expect { Rake::Task['import:movies'].invoke(csv_file) }.to change(Movie, :count).by(14) # Assuming there are two movies in the CSV file
    end

    it 'creates movies with the correct attributes' do
      Rake::Task['import:movies'].invoke(csv_file)

      # Check that the movies are created with the correct attributes
      movie1 = Movie.find_by(title: 'Inception')
      movie2 = Movie.find_by(title: 'Gone in 60 seconds')

      expect(movie1).to be_present
      expect(movie1.movie_year).to eq(2010)

      expect(movie2).to be_present
      expect(movie2.movie_year).to eq(2000)
      # ... add more expectations for other attributes
    end
  end
end
