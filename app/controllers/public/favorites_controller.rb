class Public::FavoritesController < ApplicationController

  def create
    @consultation = Consultation.find(params[:consultation_id])
    favorite = current_end_user.favorites.new(consultation_id: @consultation.id)
    favorite.save
    #非同期通信
  end

  def destroy
    @consultation = Consultation.find(params[:consultation_id])
    favorite = current_end_user.favorites.find_by(consultation_id: @consultation.id)
    favorite.destroy
    #非同期通信
  end

end
