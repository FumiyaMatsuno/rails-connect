class TermsController < ApplicationController
  before_action :genre_set

  def index
    @terms = Term.order("created_at DESC")
  end

  def new
    @term = Term.new
  end

  def create
    @term = Term.new(term_params)
    if @term.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def term_params
    params.require(:term).permit(:title,:text,:genre_id)
  end

  def term_show
    @term = term.find(params[:id])
  end

  def genre_set
    @genre = Genre.all.where.not(id: 1)
  end



end