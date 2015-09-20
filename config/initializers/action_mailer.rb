ActionMailer::Base.default_url_options = { host: ENV['APPLICATION_URL'] }

if ENV['MAIL_SERVER_URL'].present?
  mail_server = URI.parse(ENV['MAIL_SERVER_URL'])
  mail_params = Hash[URI::decode_www_form(mail_server.query)] unless mail_server.query.blank?
  ActionMailer::Base.delivery_method = mail_server.scheme.to_sym
  ActionMailer::Base.smtp_settings   = {
      address:   mail_server.host,
      port:      mail_server.port,
      user_name: mail_server.user,
      password:  mail_server.password,
      domain:               mail_params.blank? ? nil : mail_params['domain'],
      authentication:       mail_params.blank? ? nil : mail_params['authentication'],
      enable_starttls_auto: mail_params.blank? ? nil : (mail_params['starttls_auto'] == 'true')
  }
end
