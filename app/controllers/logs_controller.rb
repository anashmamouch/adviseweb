class LogsController < ApplicationController

	
	def index
		@logs = Log.paginate(:page => params[:page],:per_page => 10).order('created_at DESC')
		#expires_in 5.minutes, public: true
		@count = Log.count

		fresh_when @logs
		fresh_when @count

		respond_to do |format|
			  format.html  
			  format.json { @all_logs = Log.all ; render json: @all_logs }
		end

	end
	
	
	def create
		@log = Log.new(log_params)
		@log.save

		redirect_to root_url
	end

	def show
		@log = Log.find(params[:id])

		respond_to do |format|
			  format.html { @log.destroy ; redirect_to root_url and return}
			  format.json { render json: @log }
		end
		#Log.find(params[:id]).destroy
		
		
	end
	
	def destroy
		Log.find(params[:id]).destroy
		
		redirect_to root_url
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	    def set_log
	      @log = Log.find(params[:id])
	    end

		def log_params
			params.require(:log).permit(:title, :body)
		end
end
