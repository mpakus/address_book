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

  def flash_message(flash)
    html = ''
    flash.each do |name, msg|
      next if !msg.is_a?(String) && msg.blank? && name.blank?
      html << %(
        <div class="alert alert-#{name.to_s == 'notice' ? 'success' : 'danger'}">
          #{content_tag(:div, msg, id: "flash_#{name}")}
        </div>
        <script type="text/javascript">
          $('.alert').delay(5000).fadeOut('slow');
        </script>
      )
    end
    html.html_safe
  end

  def title(title)
    content_for :title, strip_tags(title)
  end
end
