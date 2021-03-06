class AccountsController < InheritedResources::Base
	def new
    @account = Account.new
  end

	def create
    @account = Account.new(params[:account])
    @account.save

    user = @account.admin_users.new
    user.email = params[:email]
    user.password = params[:password]
    user.password_confirmation = params[:password_confirmation]
    user.role = params[:role]
    user.first = params[:first]
    user.last = params[:last]
    user.save

    sign_in(user)

    redirect_to admin_account_path(@account)
	end
end