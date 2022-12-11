module ApplicationHelper
  def default_meta_tags
    {
      site: "自家用車を活用して誰でも簡単に副収入を稼ぐならドライバドス",
      title:"<%= yield(:title) | ドライバドズ' %>",
      description: "自家用車を活用して副収入を稼ぐならドライバドス。安定的な収入を確保出来ます。",
      canonical: request.original_url,  # 優先されるurl
      charset: "UTF-8",
      reverse: true,
      separator: '|',
      icon: [
        { href: image_url('favicon.ico') },
        { href: image_url('favicon.ico'),  rel: 'apple-touch-icon' },
      ],
	    canonical: request.original_url  # 優先されるurl

    }
  end
end
