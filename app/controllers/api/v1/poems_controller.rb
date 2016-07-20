class Api::V1::PoemsController < Api::V1::ApiController

  def index
    per_page = params[:per_page] || 50
    page = params[:page] || 1

    @poems = Poem.includes(:lines).order('id DESC').paginate(per_page: per_page, page: page).all
  end

  def show
    @poem = Poem.includes(:lines).find(params[:id])
  end

  def create
    @poem = Poem.generate!
  end

end