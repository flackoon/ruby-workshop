class AccountController < ApplicationController
  before_action :set_account, only: [:index, :edit, :update, :destroy]

	def index
		if !user_signed_in?
			return redirect_to new_user_session_path
		end
  end

  def show
    if session[:user_id].nil?
      return redirect_to new_user_session_path
    elsif params[:id] == session[:user_id].to_s
      return redirect_to account_index_url
    end

    @account = User.find(params[:id])
  end

  # GET /account/register
  def register
    @account = User.new
  end

  # GET /account/edit
  def edit
  end

  # POST /account
  def create
    @account = User.new(account_params)

    respond_to do |format|
      if @account.save
        session[:user_id] = @account.id
        format.html { redirect_to root_path }
        format.json { render 'sessions#new', status: :created, location: login_path }
      else
        format.html { render :register }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account
  def update
    update_params = account_params

    if !params[:user][:picture].nil?
      name = params[:user][:picture].original_filename
      profile_picture_path = File.join('app', 'assets', 'images', 'avatars', name)
  
      update_params[:picture] = File.join('avatars', name)
      File.open(profile_picture_path, 'wb') { |f| f.write(params[:user][:picture].read) }
    end

    respond_to do |format|
      if @account.update(update_params)
        format.html { redirect_to account_index_url, notice: 'User was successfully updated.' }
        format.json { render :index, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_account
			@account = current_user
    end

    def account_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
