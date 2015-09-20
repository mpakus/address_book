require 'csv'

class ExportCsvFile
  class << self
    def perform(items, file_name)
      file_path = Rails.root.join('public', 'uploads', 'tmp', file_name).to_s
      CSV.open(file_path, 'wb', col_sep: ';') do |csv|
        csv << ['First name', 'Last name', 'Phones (,)', 'Emails (,)']
        items.each do |item|
          csv << [
            item.first_name,
            item.last_name,
            item.phones.pluck(:phone).join(', ').to_s,
            item.emails.pluck(:email).join(', ').to_s
          ]
        end
      end
      file_path
    end
  end
end
