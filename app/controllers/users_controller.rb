class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_email = params["user"]["email"] 
    puts params
    existing_user = User.find_by({"email"=>user_email})
    if existing_user
      #user email is in database
      #redirect to login page
      #flash notice "user email is taken"
      flash["notice"] = "user email is taken"
      redirect_to "/login"
    
    else 
      @user = User.new
      @user["first_name"] = params["user"]["first_name"]
      @user["last_name"] = params["user"]["last_name"]
      @user["email"] = params["user"]["email"]
      @user["password"] = BCrypt::Password.create(params["user"]["password"])
      @user.save
      redirect_to "/posts"
    
    
    end 

  end
end

