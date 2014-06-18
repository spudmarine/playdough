class UsersController < ApplicationController

	def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)

  	respond_to do |format|
  		if @user.save
  			format.html { redirect_to admin_users_url, notice: 'User was successfully created.' }
  			format.json {render json: @user, status: :created, location: [:admin,@user] }
  		else
  			format.html { render action: "new" }
  			format.json { render json: @user.errors, status: :unprocessable_entity }
  		end
  	end
  end

  def edit
  	@user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    if @user.update_attributes!(user_params)
      redirect_to admin_path, notice: "User has been updated."
    else
      render "edit"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  

end
