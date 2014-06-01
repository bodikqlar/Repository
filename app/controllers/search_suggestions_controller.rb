class SearchSuggestionsController < ApplicationController
	def index
		render json: SearchSuggestion.terms_for(params[:term])
		render "users/sortable_list"
	end
end
