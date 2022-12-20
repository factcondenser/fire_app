class SampleIncome < ApplicationSample
  DEPENDENCIES = %w[User IncomeCategory].freeze

  def load
    count.times do
      create(:income, user_id: random_id_for(User), category_id: random_id_for(IncomeCategory))
    end
  end
end
