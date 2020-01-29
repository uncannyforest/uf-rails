module ApplicationHelper
  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    return markdown.render(text).html_safe
  end

  def section(link)
    if (@section == link)
      'page-' + link.to_s + '-sel-2x.png'
    else
      'page-' + link.to_s + '-2x.png'
    end
  end
end
