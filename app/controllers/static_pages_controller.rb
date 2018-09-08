class StaticPagesController < ApplicationController
  def home
  end

  def check_asin
    @response_code = Asin.get_response_code(params[:asin]) if params[:asin].present?
    render partial: 'check_asin.js.erb', locals: { response_code: @response_code }
  end
end