# frozen_string_literal: true

class PostsController < ApplicationController
  include SessionsHelper

  before_action :set_postbox, only: [:index, :create]
  before_action :require_admin_login, only: [:index]

  def index
    respond_to do |format|
      format.csv { csv_export(@postbox) }
      format.json { json_export(@postbox) }
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = @postbox.posts.build(post_prams)
    if @post.save
      notify_to_slack(@postbox, @post)
      redirect_to postbox_path(@postbox.uid), notice: "入力した内容を投稿しました。投稿内容は投書箱を作成した管理者のみが閲覧できます。"
    else
      redirect_to postbox_path(@postbox.uid), alert: @post.errors.full_messages_for(:content)
    end
  end

  private
    def post_prams
      params.permit(:content)
    end

    def set_postbox
      @postbox = Postbox.find_by(uid: params[:postbox_uid])
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

    def csv_export(postbox)
      csv_data = CSV.generate do |csv|
        csv_column_names = ["投稿内容", "投稿時間"]
        csv << csv_column_names
        postbox.posts.each do |post|
          csv_column_values = [
            post.content,
            post.created_at.strftime("%Y/%-m/%-d %-H:%-M:%-S"),
          ]
          csv << csv_column_values
        end
      end
      send_data(csv_data, filename: "posts.csv")
    end

    def json_export(postbox)
      posts = []
      postbox.posts.each do |post|
        posts.push(content: post.content, date: post.created_at.strftime("%Y/%-m/%-d %-H:%-M:%-S"))
      end
      send_data(hash.to_json, filename: "posts.json")
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
