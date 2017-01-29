class FiguresController < ApplicationController
  
  get '/figures' do
  	erb :'figures/index'
  end

	get '/figures/new' do 
		erb :'figures/new'
	end

	post '/figures' do
    @figure = Figure.create(name: params["figure"]["name"])
    @figure.landmark_ids = params["figure"]["landmark_ids"]
    @figure.landmarks << Landmark.create(params["landmark"]) unless params["landmark"]["name"].empty?
    @figure.title_ids = params["figure"]["title_ids"]
    @figure.titles.create(name: params["title"]["name"]) unless params["title"]["name"].empty?
    @figure.save
    
		redirect to "/figures/#{@figure.id}"
	end

	get '/figures/:id' do
		@figure = Figure.find(params[:id])

		erb :'figures/show'
	end
  
  get '/figures/:id/edit' do
		@figure = Figure.find(params[:id])

		erb :'figures/edit'
	end

	post '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])

    @figure.name = params["figure"]["name"] 
    @figure.landmark_ids = params["figure"]["landmark_ids"]
    @figure.landmarks << Landmark.create(params["landmark"]) unless params["landmark"]["name"].empty?
    @figure.title_ids = params["figure"]["title_ids"]
    @figure.titles.create(name: params["title"]["name"]) unless params["title"]["name"].empty?
    @figure.save

    redirect to "/figures/#{@figure.id}"
	end

end
