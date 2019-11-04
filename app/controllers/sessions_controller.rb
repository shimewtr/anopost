# frozen_string_literal: true

class SessionsController < ApplicationController
  include SessionsHelper
  def create
    postbox = Postbox.find_by(uid: params[:uid])
    if postbox && postbox.authenticate(params[:password])
      log_in postbox
      redirect_to postbox_path(postbox.uid), notice: "管理者としてログインしました。"
    else
      redirect_to postbox_path(postbox.uid), alert: ["パスワードが正しくありません。"]
    end
  end

  def destroy
    log_out
    redirect_to root
  end
end
