class Login
  include ActiveModel::Model

  validates_with LoginValidator

  attr_accessor :email, :password, :session

  def save
    session[:user_id] = user.id if valid?
  end

  def destroy
    session.delete(:user_id)
  end

  def user
    email.presence && User.find_by(email:)
  end

  # Finding the user is analogous to finding the Login if Login were an AR.
  def to_param
    user.id
  end
end
