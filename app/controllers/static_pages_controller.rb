class StaticPagesController < ApplicationController
  def home
  end

  def check_asin
    validate_asin
    @response_code = Asin.get_response_code(params[:asin]) unless @errors.any?
    render partial: 'check_asin.js.erb', locals: { response_code: @response_code }
  end

  private

  def validate_asin
    @errors = []
    if params[:asin].present?
      asin = params[:asin]
      @errors << 'ASIN must only contain letters and numbers.' unless asin =~ /^[a-zA-Z0-9]+$/
    else
      @errors << 'No ASIN provided, please provide an ASIN in the field above.'
    end
  end
end