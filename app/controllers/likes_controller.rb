class LikesController < ApplicationController
  before_action :term_params

  def create
    Like.create(user_id: current_user.id, term_id: params[:id])
  end

  def destroy
    Like.find_by(user_id: current_user.id, term_id: params[:id]).destroy
  end

  private

  def term_params
    @term = Term.find(params[:id])
  end
end
