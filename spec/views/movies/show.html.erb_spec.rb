require 'rails_helper'

RSpec.describe "movies/show", type: :view do
  before(:each) do
    assign(:movie, Movie.create!(
      title: "Title",
      description: "MyText",
      movie_year: 2,
      actor: "Actor",
      filming_location: "Filming Location",
      country: "Country"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Actor/)
    expect(rendered).to match(/Filming Location/)
    expect(rendered).to match(/Country/)
  end
end
