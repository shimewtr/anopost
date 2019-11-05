# frozen_string_literal: true

class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @postbox = Postbox.find_by(uid: params[:uid])
    @post = @postbox.posts.build(post_prams)
    if @post.save
      notify_to_slack(@postbox, @post)
      redirect_to postbox_path(@postbox.uid), notice: "投稿しました"
    else
      redirect_to postbox_path(@postbox.uid), alert: @post.errors.full_messages_for(:content)
    end
  end

  private
    def post_prams
      params.permit(:content)
    end

    def notify_to_slack(postbox, post)
      if postbox.slack_webhook_url.present?
        username = "AnoPost"
        attachments = [{
          title: postbox.title,
          title_link: "#{request.scheme}://#{request.domain}:#{request.port}/#{postbox.uid}",
          fallback: "comment body.",
          author_name: "AnoPost",
          author_icon: "https://raw.githubusercontent.com/wawawatataru/anopost/master/app/assets/images/android-chrome-256x256.png",
          text: post.content,
        }]
        url = postbox.slack_webhook_url
        notifier = Slack::Notifier.new url, username: username
        notifier.ping "#{postbox.title}に投稿がありました。", attachments: attachments
      end
    end
end
