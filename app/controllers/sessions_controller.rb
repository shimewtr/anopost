# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    postbox = Postbox.find_by(uid: params[:uid])
    if postbox && postbox.authenticate(params[:password])
      redirect_to postbox_path(postbox.uid), notice: "OK"
    else
      redirect_to postbox_path(postbox.uid), alert: ["パスワードが正しくありません。"]
    end
  end

  def destroy
  end
end
