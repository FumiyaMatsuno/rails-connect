class TermsController < ApplicationController
  before_action :genre_set
  before_action :move_to_new, except: [:index, :create, :show, :search]
  before_action :set_term , only: [:show, :destroy, :edit, :update]

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
    @terms = Term.find(params[:id])
  end

  def edit
  end

  def update
    if @term.update(term_params)
      redirect_to root_path
    else
      redirect_to action: :edit
    end
  end

  def destroy
    if @term.destroy
      redirect_to terms_path
    else
      redirect_to action: :show
    end
  end

  def genre
    @terms = Term.genre(params[:id])
  end

  def research
    @terms = Term.research(params[:keyword])
  end

  private

  def move_to_new
    redirect_to new_user_session_path unless user_signed_in?
  end

  def term_params
    params.require(:term).permit(:title,:reference,:text,:genre_id).merge(user_id: current_user.id)
  end

  def set_term
    @term = Term.find(params[:id])
  end

  def genre_set
    @genres = Genre.all.where.not(id: 1)
  end

end