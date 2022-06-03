class TransactionsController < ApplicationController
  # GET /transactions or /transactions.json
  def index
    @category = Category.find(params[:category_id])
    @transactions = @category.transactions.order(created_at: :desc)
  end

  # GET /transactions/1 or /transactions/1.json
  def show; end

  # GET /transactions/new
  def new
    @user = current_user
    @category = Category.find(params[:category_id])
    @transaction = Transaction.new
  end

  # POST /transactions or /transactions.json
  def create
    @category = Category.find(params[:category_id])
    @transaction = current_user.transactions.create(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html do
          redirect_to category_transactions_path(@category.id), notice: 'Transaction was successfully created.'
        end
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
    flash[:success] = 'Category deleted successfully'
    redirect_to category_transactions_path(@category.id)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def transaction_params
    params.require(:transaction).permit(:name, :amount, :category_id, :user_id)
  end
end
