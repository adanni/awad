class SearchController < ApplicationController
	include ApplicationHelper
	include SessionsHelper
	def index
		if (params[:search]).blank?
			@schools = ""
		else
			@schools = School.query(params[:search])
		end
  	end

	def show
		postcode = params[:id]
		@place = School.where("postcode = ?", postcode)
		gon.mypostcode = params[:id]
	end
end
