class ImportsController < ApplicationController
  def create
    if import.save && import.perform_file
      Import.destroy_all
      redirect_to imports_path, notice: t('.success')
    else
      render :index
    end
  end

  private

  def import
    @import ||= Import.new(import_params)
  end
  helper_method :import

  def import_params
    params.fetch(:import, {}).permit(:file)
  end
end
