class Import < ActiveRecord::Base
  mount_uploader :file, ImportFileUploader

  validates :file, presence: true

  def perform_file
    errors = ImportCsvFile.perform(file.path)
    if errors.any?
      errors.each { |error| self.errors.add(:file, error) }
      return false
    end
    true
  end
end
