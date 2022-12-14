class SampleExpense < ApplicationSample
  dependencies User, ExpenseCategory

  def load
    count.times do
      create(:expense, created_by_id: random_id_for(User), category_id: random_id_for(ExpenseCategory))
    end
  end
end
