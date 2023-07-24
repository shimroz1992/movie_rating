require 'rails_helper'

RSpec.describe "movies/edit", type: :view do
  let(:movie) {
    Movie.create!(
      title: "MyString",
      description: "MyText",
      movie_year: 1,
      actor: "MyString",
      filming_location: "MyString",
      country: "MyString"
    )
  }

  before(:each) do
    assign(:movie, movie)
  end

  it "renders the edit movie form" do
    render

    assert_select "form[action=?][method=?]", movie_path(movie), "post" do

      assert_select "input[name=?]", "movie[title]"

      assert_select "textarea[name=?]", "movie[description]"

      assert_select "input[name=?]", "movie[movie_year]"

      assert_select "input[name=?]", "movie[actor]"

      assert_select "input[name=?]", "movie[filming_location]"

      assert_select "input[name=?]", "movie[country]"
    end
  end
end
