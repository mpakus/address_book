require 'csv'

class ImportCsvFile
  class << self
    def perform(file)
      errors = []
      i = 0
      CSV.foreach(file, { col_sep: ';' }) do |row|
        # First name | Last Name | Phones, | Emails,
        i += 1
        next if i == 1
        err = add_contact(row)
        unless err.nil?
          errors << err
        end
      end
      errors
    end

    private

    def add_contact(row)
      User.transaction do
        user = User.find_or_create_by!(
            first_name: row[0],
            last_name:  row[1]
        )
        find_or_create_phones!(row[2], user)
        find_or_create_emails!(row[3], user)
        nil
      end
    rescue => e
      e.message + ": '#{row[0]} #{row[1]}'"
    end

    def find_or_create_phones!(phone_row, user)
      phones = split_comma(phone_row)
      return unless phones.any?
      phones.each do |phone|
        user.phones.find_or_create_by!(phone: phone)
      end
    end

    def find_or_create_emails!(email_row, user)
      emails = split_comma(email_row)
      return unless emails.any?
      emails.each do |email|
        user.emails.find_or_create_by!(email: email)
      end
    end

    def split_comma(line)
      line.to_s.split(/\s*,\s*/)
    end
  end
end
