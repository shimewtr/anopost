# frozen_string_literal: true

module PostboxsHelper
  def postbox_submit_label(from)
    if from == :new
      "作成"
    else
      "更新"
    end
  end

  def generate_url
    scheme = request.scheme
    domain = request.domain
    port = ""
    if (request.port != 80) && (request.port != 443)
      port = ":#{request.port}"
    end
    postbox_uid = @postbox.uid
    "#{ scheme }://#{ domain }#{ port }/#{ postbox_uid }"
  end
end
