class Api::NamesController < ApplicationController

  def index
    @names = %w(Batman Robin Catwoman)
    respond_to do |format|
      format.json do
        render json: @names.to_json
      end
    end
  end

end
