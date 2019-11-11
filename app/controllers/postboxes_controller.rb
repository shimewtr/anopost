# frozen_string_literal: true

class PostboxesController < ApplicationController
  include SessionsHelper

  before_action :set_postbox, only: [:show, :edit, :update, :destroy]
  before_action :require_admin_login, only: [:edit, :update, :destroy]

  def index
    @postboxes = Postbox.all
  end

  def show
  end

  def new
    @postbox = Postbox.new
  end

  def create
    @postbox = Postbox.new(postbox_prams)
    if @postbox.save
      redirect_to postbox_path(uid: @postbox.uid), notice: "#{@postbox.title}を作成しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @postbox.update(update_postbox_prams)
      redirect_to postbox_path(uid: @postbox.uid), notice: "#{@postbox.title}を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @postbox.destroy
    redirect_to root_path, notice: "#{@postbox.title}を削除しました"
  end

  def to_param
    self.uid
  end

  private
    def set_postbox
      @postbox = Postbox.find_by!(uid: params[:uid])
    end

    def postbox_prams
      params.require(:postbox).permit(:title, :description, :password, :password_confirmation)
    end

    def update_postbox_prams
      params.require(:postbox).permit(:title, :description, :slack_webhook_url)
    end
end
