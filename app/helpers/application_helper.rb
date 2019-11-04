# frozen_string_literal: true

module ApplicationHelper
  include SessionsHelper

  def page_title
    title = "AnoPost"
    title = @page_title + " | " + title if @page_title
    title
  end

  def show_or_edit_postbox_page?
    controller_path == "postboxes" && ((action_name == "show") || (action_name == "edit"))
  end
end
