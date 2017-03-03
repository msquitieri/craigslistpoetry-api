class Api::V1::LinesController < Api::V1::ApiController

  def index
    per_page = params[:per_page] || 50
    page = params[:page] || 1

    @lines = Line.where(live: false).paginate(per_page: per_page, page: page).all
  end

  def show
    @line = Line.find(params[:id])
  end

  def update
    @line = Line.find(params[:id])

    unless line.update_attributes(line_attrs)
      render_unprocessable_entity(:line, line) and return
    end
  end

  private

  def line_attrs
    params.permit(:spam)
  end

end