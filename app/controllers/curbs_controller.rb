class CurbsController < ApplicationController
 before_action :set_curb, only: [:show, :edit, :update, :destroy]

	def index
		@curb = Curb.all
	end

	def show
		@curb= Curb.find(params[:id])
	end

	def new
		@curb = Curb.new
	end

	def edit 
		@curb = Curb.find(params[:id])
 
	end

	def create
	  @curb = Curb.new(curb_params)

    if @curb.save
      flash[:succes] = "New curb Created!"
      redirect_to curbs_path
    else
      render 'new'
    end
  end

	  def update
	  	@curb = Curb.find(params[:id])

	    if @curb.update(curb_params)
	      redirect_to curbs_path
	    else
	      render 'edit'
	    end
	  end

	 def destroy
	 
	    @curb.destroy
	    redirect_to curbs_path, notice: 'Your Post was Deleted!'
	  end


	private

		def set_curb
			@curb = Curb.find(params[:id])
		end

		def curb_params
			params.require(:curb).permit(:subject, :address, :content, :picture)
		end

end


