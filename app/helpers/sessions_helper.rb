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
    !current_postbox.nil?
  end
end
