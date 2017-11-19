require 'ostruct'
class SearchesController < ApplicationController

  def show
    @results = Program.where(["title like :query or description like :query", {:query => "%#{params[:query]}%"}])
  end

  def list
    @results = Program.where(["title like :query or description like :query", {:query => "%#{params[:query]}%"}])
  end

end