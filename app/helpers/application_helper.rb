# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def button_tag(content_or_options_with_block = nil, options = nil, escape = true, &block)
    content_tag(:button, content_or_options_with_block, options, escape, &block) 
  end
end
