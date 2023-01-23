class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :load_session

  # include CurrentCart
  # before_action :set_cart

  def load_session
    session["init"] = true
  end
end
