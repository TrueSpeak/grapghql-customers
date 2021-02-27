module Mutations
  class CreateCustomer < BaseMutation
    argument :name, String, required: true
    argument :description, String, required: true

    type Types::CustomerType

    def resolve(**options)
      customer = Customer.new(options)

      if customer.save
        customer
      else
        { errors: customer.errors.full_messages }
      end
    end
  end
end
