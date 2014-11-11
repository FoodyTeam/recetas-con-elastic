class SearchController < ApplicationController
	def search
  if params[:q].nil?
    @recetas = []
  else
    @recetas = Receta.search params[:q]
  end
    end
end
