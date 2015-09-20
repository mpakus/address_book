class ExportsController < ApplicationController
  def create
    file_name = 'contacts_export.csv'
    file_path = ExportCsvFile.perform(User.includes(:emails, :phones).all, file_name)
    send_file file_path, filename: file_name, disposition: 'attachment'
  end
end
