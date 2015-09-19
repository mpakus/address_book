module ApplicationHelper
  def form_errors(form)
    html = ''
    if form && form.errors.any?
      html << '<div class="alert-danger alert"><ul>'
      form.errors.each do |_field, msg|
        html << %(<li>#{msg}</li>)
      end
      html << '</ul></div>'
    end
    html.html_safe
  end

  def title(title)
    content_for :title, strip_tags(title)
  end
end
