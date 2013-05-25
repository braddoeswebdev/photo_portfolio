class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_for_codes

  def check_for_codes
    session[:codes] ||= []
    @collections = Collection.where(:code => session[:codes]).all + Collection.where(:code => ["", nil]).all
  end
end
