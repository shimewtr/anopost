# frozen_string_literal: true

module MetaTagsHelper
  def default_meta_tags
    {
      site: "AnoPost",
      title: "AnoPost",
      reverse: true,
      charset: "utf-8",
      description: "AnoPostは企業倫理ホットラインを簡単に作成できるWebサービスです。",
      keywords: "企業倫理,ホットライン,匿名,投書箱",
      canonical: request.original_url,
      separator: "|",
      og: {
        site_name: "AnoPost",
        title: "AnoPost",
        description: "AnoPostは企業倫理ホットラインを簡単に作成できるWebサービスです。",
        type: "website",
        url: root_url,
        image: image_url("apple-touch-icon.png"),
        locale: "ja_JP",
      },
      twitter: {
        card: "summary",
      }
    }
  end
end
