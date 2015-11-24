module ApplicationHelper

  def markdown_to_html(markdown)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render markdown).html_safe
  end

  def toPhone(number)
    number.gsub!(/[^0-9A-Za-z]/, '')
    number.insert(0, '(')
    number.insert(4, ')')
    number.insert(5, ' ')
    number.insert(9, '-')
  end

end
