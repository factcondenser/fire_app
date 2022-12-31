class LoginsController < ApplicationController
  before_action :set_login, only: :destroy

  def new
    @login = Login.new
  end

  def create
    @login = Login.new(login_params)
    @login.email.downcase!

    if @login.save
      redirect_to root_url, notice: 'Login succeeded!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @login.destroy

    redirect_to new_login_url, notice: 'Logged out!'
  end

  private

  def set_login
    @login = Login.new(session:)
  end

  def login_params
    params.require(:login).permit(:email, :password).merge(session:)
  end
end
