# frozen_string_literal: true

class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @postbox = Postbox.find_by(uid: params[:uid])
    @post = @postbox.posts.build(post_prams)
    if @post.save
      redirect_to postbox_path(@postbox.uid), notice: "投稿しました"
    else
      redirect_to postbox_path(@postbox.uid), alert: @post.errors.full_messages_for(:content)
    end
  end

  private
    def post_prams
      params.permit(:content)
    end
end
