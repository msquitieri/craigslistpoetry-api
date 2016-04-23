class Api::V1::PoemsController < Api::V1::ApiController

  def show
    @poem = Poem.includes(:lines).find(params[:id])
  end

end