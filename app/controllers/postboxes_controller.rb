# frozen_string_literal: true

class PostboxesController < ApplicationController
  before_action :set_postbox, only: [:show, :edit, :update, :destroy]

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
      params.require(:postbox).permit(:title, :description, :is_published)
    end

    def update_postbox_prams
      params.require(:postbox).permit(:title, :description)
    end
end
