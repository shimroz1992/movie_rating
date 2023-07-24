require 'rails_helper'

RSpec.describe "movies/index", type: :view do
  before(:each) do
    assign(:movies, [
      Movie.create!(
        title: "Title",
        description: "MyText",
        movie_year: 2,
        actor: "Actor",
        filming_location: "Filming Location",
        country: "Country"
      ),
      Movie.create!(
        title: "Title",
        description: "MyText",
        movie_year: 2,
        actor: "Actor",
        filming_location: "Filming Location",
        country: "Country"
      )
    ])
  end

  it "renders a list of movies" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Actor".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Filming Location".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Country".to_s), count: 2
  end
end
