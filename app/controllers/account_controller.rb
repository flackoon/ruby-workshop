class AccountController < ApplicationController
  before_action :set_account, only: [:index, :edit, :update, :destroy]

  def index
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
    respond_to do |format|
      if @account.update(account_params)
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
      @account = User.find(session[:user_id])
    end

    def account_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
