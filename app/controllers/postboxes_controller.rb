# frozen_string_literal: true

class PostboxesController < ApplicationController
  include SessionsHelper

  before_action :set_postbox, only: [:show, :edit, :update]
  before_action :require_admin_login, only: [:edit, :update]

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
    @postbox.uid = SecureRandom.urlsafe_base64(20)
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
  end

  def to_param
    self.uid
  end

  private
    def set_postbox
      @postbox = Postbox.find_by!(uid: params[:uid])
    end

    def postbox_prams
      params.require(:postbox).permit(:title, :description, :is_published, :password, :password_confirmation)
    end

    def update_postbox_prams
      params.require(:postbox).permit(:title, :description, :slack_webhook_url)
    end

    def require_admin_login
      unless admin_login?
        redirect_to root_path, alert: ["管理者としてログインしてください"]
      end
    end

    def admin_login?
      logged_in? && @postbox.uid == session[:postbox]
    end
end
