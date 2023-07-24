class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ show edit update destroy ]

  # GET /movies or /movies.json
  def index
    if params[:actor_name].present?
      @movies = Movie.search_by_actor(params[:actor_name])
    else
      @movies = Movie.all
    end

    if params[:sort].present? && ['asc', 'desc'].include?(params[:sort].downcase)
      sort_order = params[:sort].downcase
      @movies = @movies.order("avg_rating #{sort_order}")
    else
    # Default sorting (e.g., by ID or any other attribute)
    @movies = @movies.order(:id)
  end
end

  # GET /movies/1 or /movies/1.json
  def show
  end

  def rate
    # @movie = Movie.find(params[:id])

    Rate.find_by(rater_id: current_user.id, rateable_id: params[:id]).update(comments: params[:comment])
    render json: { status: :ok }
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies or /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to movie_url(@movie), notice: "Movie was successfully created." }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to movie_url(@movie), notice: "Movie was successfully updated." }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to movies_url, notice: "Movie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:title, :description, :movie_year, :actor, :filming_location, :country, :director)
    end
  end
