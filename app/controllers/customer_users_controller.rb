class CustomerUsersController < InheritedResources::Base

    def new
        @products = Product.all
        o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
        @random_password = (0...12).map { o[rand(o.length)] }.join
    end

    def edit
        @products = Product.all
        @customer_user = CustomerUser.find(params[:id])
    end

    def show
        @customer_user = CustomerUser.find(params[:id])
        @products = @customer_user.products
    end

    def update
        @customer_user = CustomerUser.find(params[:id])
        @customer_user.email = params[:customer_user][:email]
        @customer_user.password = params[:customer_user][:password]
        @customer_user.products.delete_all
        params[:customer_user][:products].each { |p|
            unless p == ''
                product = Product.find(p)
                @customer_user.products << product
            end
        }
        @customer_user.save
        render 'show'
    end

  private

    def customer_user_params
      params.require(:customer_user).permit(:email, :password)
    end
end

