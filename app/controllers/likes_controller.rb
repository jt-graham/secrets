class LikesController < ApplicationController
  before_action :require_login, only: [:create, :destroy]

  def create
  	secret = Secret.find(params['secret_id'])
  	like = Like.create(user: current_user, secret: secret)
  	redirect_to :back
  end

  def destroy
  	like = Like.find(params[:id]).destroy
  	like.destroy if like.user == current_user
  	redirect_to "/secrets"
  end

end
