class CodeController < ApplicationController
  def index
  end

  def create
    session[:codes] << params[:c]
    @c = params[:c]
  end

  def destroy
    session[:codes].delete params[:c]
    @c = params[:c]
  end
end
