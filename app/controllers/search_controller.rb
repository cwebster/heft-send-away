class SearchController < ApplicationController
	def search
		@answer = Laboratory.raw_search(params[:search_items])
	end
end
