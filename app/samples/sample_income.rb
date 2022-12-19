class SampleIncome < ApplicationSample
  DEPENDENCIES = %w[User IncomeCategory].freeze

  def load
    count.times do
      create(:income, user_id: random_user_id, category_id: random_category_id)
    end
  end

  private

  def random_user_id
    random_user_offset = rand(user_count)
    User.offset(random_user_offset).pick(:id)
  end

  def random_category_id
    random_category_offset = rand(category_count)
    IncomeCategory.offset(random_category_offset).pick(:id)
  end

  def user_count
    @user_count ||= User.count
  end

  def category_count
    @category_count ||= IncomeCategory.count
  end
end
