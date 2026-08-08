module Api
  module V1
    class CustomersController < ApiController
      skip_before_action :ensure_authenticated
      skip_forgery_protection

      before_action :find_customer, only: %i[show update destroy]

      # GET /api/v1/customers.json
      # Fetches and returns the list of customers
      def index
        customers = Customer.all

        render_data data: customers, status: :ok
      end

      # GET /api/v1/customers/:id.json
      # Fetches and returns a customer's data
      def show        
        render_data data: customer, status: :ok
      end

      # POST /api/v1/customers.json
      # Creates a customer
      def create        
        customer = Customer.create!(customer_params)

        # customer = Customer.new(customer_params)
        # return render_error errors: customer.errors.to_a unless customer.save

        render_data data: customer, status: :created
      end

      # PUT/PATCH /api/v1/customers/:id.json
      # Updates a customer
      def update        
        # return render_error errors: @customer.errors.to_a, status: :bad_request unless @customer.update(customer_params)
        @customer.update!(customer_params)

        render_data data: @customer, status: :ok
      end

      # DELETE /api/v1/customers/:id.json
      # Deletes a customer
      def destroy
        return render_error errors: @customer.errors.to_a, status: :bad_request unless @customer.destroy

        # @customer.destroy!

        render_data data: "DELETED", status: :ok
      end

      private

      def customer_params
        params.require(:customer).permit(:name, :age, :pincode)
      end

      def find_customer
        @customer = Customer.find_by!(id: params[:id])
      end
    end
  end
end
