class API::VisitsController < API::APIController

	def index
		@visit_of = params[:dog_id]

		if @visit_of
			@visits = Visit.find_by_dog_id(@visit_of)
			render json: @visits, status: :ok
		else
			render json: Visit.all, stauts: :ok
		end
	end

	def create
		@visit = Visit.new(visit_params)
		@visit.visit = Date.today

		if @visit.save
			render json: @visit, status: :ok
		else
			render :index
		end
	end

	private
	def visit_params
		params.require(:visit).permit(:dog_id, :visit)
	end

end