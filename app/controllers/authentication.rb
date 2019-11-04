# frozen_string_literal: true

module Authentication
  def require_admin_login
    unless admin_login?
      redirect_to root_path, alert: "管理者としてログインしてください"
    end
  end

  def admin_login?
    logged_in? && current_user.admin?
  end
end
