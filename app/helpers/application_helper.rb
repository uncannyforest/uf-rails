module ApplicationHelper
  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    return markdown.render(text).html_safe
  end

  def section(link)
    if (@section == link)
      'section curr-section'
    else
      'section'
    end
  end
end
