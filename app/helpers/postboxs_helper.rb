# frozen_string_literal: true

module PostboxsHelper
  def postbox_submit_label(from)
    if from == :new
      "作成"
    else
      "更新"
    end
  end
end
