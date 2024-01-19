class SearchController < ApplicationController
  def index
    @searches = Search.available
  end

  def create
    search_text = params[:search_text]
    search = Search.new(text: search_text, user_ip: request.remote_ip)

    if search.save
      render json: { status: 'success', search: search_text }
    else
      render json: { status: 'error', message: 'Failed to save search' }
    end
  end
end
