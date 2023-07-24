require 'rails_helper'

RSpec.describe "movies/new", type: :view do
  before(:each) do
    assign(:movie, Movie.new(
      title: "MyString",
      description: "MyText",
      movie_year: 1,
      actor: "MyString",
      filming_location: "MyString",
      country: "MyString"
    ))
  end

  it "renders new movie form" do
    render

    assert_select "form[action=?][method=?]", movies_path, "post" do

      assert_select "input[name=?]", "movie[title]"

      assert_select "textarea[name=?]", "movie[description]"

      assert_select "input[name=?]", "movie[movie_year]"

      assert_select "input[name=?]", "movie[actor]"

      assert_select "input[name=?]", "movie[filming_location]"

      assert_select "input[name=?]", "movie[country]"
    end
  end
end
