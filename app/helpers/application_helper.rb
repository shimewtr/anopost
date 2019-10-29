# frozen_string_literal: true

module ApplicationHelper
  def page_title
    title = "AnoPost"
    title = @page_title + " | " + title if @page_title
    title
  end
end
