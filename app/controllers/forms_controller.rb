class FormsController < ApplicationController

  def create
    forward_params = params.permit!
    logger.info forward_params
    FormMailer.forward_email(forward_params.to_hash.except("action", "controller", "utf8")).deliver
    redirect_to request.referer || GoodForm::Application.config.default_return_url
  end
end
