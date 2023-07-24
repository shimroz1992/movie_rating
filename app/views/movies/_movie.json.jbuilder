json.extract! movie, :id, :title, :description, :movie_year, :actor, :filming_location, :country, :created_at, :updated_at
json.url movie_url(movie, format: :json)
