class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_headers

  layout "application"

  protected

  def set_headers
    @header1 = 'Sci-Fi Voter'
    @header2 = ''
    @header3 = ''
  end
end
