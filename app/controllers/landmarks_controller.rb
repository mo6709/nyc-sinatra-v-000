class LandmarksController < ApplicationController

	get '/landmarks' do
		erb :'landmarks/index'
	end 

	get '/landmarks/new' do
		erb :'landmarks/new'
	end

	post '/landmarks' do
		@landmark = Landmark.find_or_create_by(name: params["landmark"]["name"])
        @landmark.year_completed = params["landmark"]["landmark_year_completed"]

		redirect to "/landmarks/#{@landmark.id}"
	end	
	
	get '/landmarks/:id' do
		@landmark = Landmark.find_by_id(params[:id]) 
		erb :'landmarks/show'
	end

	get '/landmarks/:id/edit' do
		@landmark = Landmark.find_by_id(params[:id])
		erb :'landmarks/edit'
	end

	post '/landmarks/:id' do
		@landmark = Landmark.find_by_id(params[:id])
        @landmark.update(params["landmark"])

		redirect to "/landmarks/#{@landmark.id}"
	end

end
