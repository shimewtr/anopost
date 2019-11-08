# frozen_string_literal: true

module SessionsHelper
  def log_in(postbox)
    session[:postbox] = postbox.uid
  end

  def current_postbox
    if session[:postbox]
      @current_postbox ||= Postbox.find_by(uid: session[:postbox])
    end
  end

  def log_out
    session.delete(:postbox)
    @current_postbox = nil
  end

  def logged_in?
    current_postbox.present?
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
