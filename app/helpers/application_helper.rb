module ApplicationHelper
  
  def menu_link_to(text, path, options = {})
    content_tag :li do
      condition = options[:method]

      link_to_if(condition, text, path, options) do
        content_tag(:span, text)
      end
    end
  end
end
