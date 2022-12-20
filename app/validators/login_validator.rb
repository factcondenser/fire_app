class LoginValidator < ActiveModel::Validator
  def validate(record)
    return if record.user&.authenticate(record.password)

    record.errors.add :base, 'Incorrect email or password, try again.'
  end
end
