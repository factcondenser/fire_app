class SampleExpense < ApplicationSample
  DEPENDENCIES = %w[User ExpenseCategory].freeze

  def load
    count.times do
      create(:expense, user_id: random_id_for(User), category_id: random_id_for(ExpenseCategory))
    end
  end
end
