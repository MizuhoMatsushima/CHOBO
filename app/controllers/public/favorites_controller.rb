class Public::FavoritesController < ApplicationController

  def create
    @consultation = Consultation.find(params[:consultation_id])
    favorite = current_end_user.favorites.new(consultation_id: @consultation.id)
    favorite.save
    respond_to :js
    #非同期通信
  end

  def destroy
    @consultation = Consultation.find(params[:consultation_id])
    favorite = current_end_user.favorites.find_by(consultation_id: @consultation.id)
    favorite.destroy
    respond_to :js
    #非同期通信
  end

  def my_index
    my_favorites = Favorite.where(end_user_id: current_end_user.id).pluck(:consultation_id)
    @favorite_consultations = Consultation.find(my_favorites)
  end

end
