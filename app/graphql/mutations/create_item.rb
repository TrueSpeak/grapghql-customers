module Mutations
  class CreateItem < BaseMutation
    argument :customer_id, ID, required: true
    argument :name, String, required: true

    type Types::ItemType

    def resolve(**options)
      customer = Customer.find_by(id: options[:customer_id])
      item = customer.items.new(name: options[:name])

      if item.save
        item
      else
        { errors: item.errors.full_messages }
      end
    end
  end
end
