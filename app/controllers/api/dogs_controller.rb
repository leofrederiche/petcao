class API::DogsController < API::APIController

	def index
		@limit = params[:limit]
		@dog_id = params[:dog_id]

		if @limit
			@dogs = Dog.last(@limit).reverse
			render json: @dogs, include: :visits, status: :ok
		elsif @dog_id
			@dog = Dog.find(@dog_id)
			render json: @dog, include: :visits, status: :ok
		else
			render json: Dog.all, include: :visits, status: :ok
		end
	end

	def create
		@dog = Dog.new(dog_params)

		if @dog.save
			redirect_to dogs_path
		else
			redirect_to new_dog_path
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