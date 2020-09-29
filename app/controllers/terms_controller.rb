class TermsController < ApplicationController
  before_action :genre_set
  before_action :move_to_new, except: [:index, :create, :show, :search]
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

  def show
    @term = Term.find(params[:id])
  end


  def genre
    @terms = Term.genre(params[:id])
  end

  private
  
  def move_to_new
    redirect_to new_user_session_path unless user_signed_in?
  end

  def term_params
    params.require(:term).permit(:title,:reference,:text,:genre_id).merge(user_id: current_user.id)
  end

  def genre_set
    @genres = Genre.all.where.not(id: 1)
  end



end