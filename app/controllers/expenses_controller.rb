class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[show edit update destroy]

  # GET /expenses
  def index
    @expenses = Expense.all
  end

  # GET /expenses/1
  def show; end

  # GET /expenses/new
  def new
    @expense = Expense.new
  end

  # GET /expenses/1/edit
  def edit; end

  # POST /expenses
  def create
    @expense = Expense.new(expense_params)

    if @expense.save
      redirect_to expense_url(@expense)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /expenses/1
  def update
    if @expense.update(expense_params)
      redirect_to expense_url(@expense)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /expenses/1
  def destroy
    @expense.destroy

    redirect_to expenses_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_expense
    @expense = Expense.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def expense_params
    params.require(:expense).permit(:amount, :category, :description, :incurred_at)
  end
end
