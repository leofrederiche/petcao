class API::DogsController < API::APIController

	def index
		@limit = params[:limit]
		@dog_id = params[:dog_id]

		if @limit
			@dogs = Dog.last(@limit).reverse
			render json: @dogs, status: :ok
		elsif @dog_id
			@dog = Dog.find(@dog_id)
			render json: @dog, status: :ok
		else
			render json: Dog.all, status: :ok
		end
	end

	def new
		@dog = Dog.new
	end

	def create
		@dog = Dog.new(dog_params)
		@dog.visited = Date.today unless @dog.visited

		if @dog.save
			render json: @dog, status: :ok
			redirect_to dogs_path
		else
			render :new
		end
	end

	private
	def dog_params
		params.require(:dog).permit(
			:breed,
			:gender,
			:castrated,
			:birth,
			:dog_name,
			:owner_name,
			:tel
		)
	end

end