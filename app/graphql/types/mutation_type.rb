module Types
  class MutationType < Types::BaseObject
    field :create_customer, mutation: Mutations::CreateCustomer
    field :create_item, mutation: Mutations::CreateItem
  end
end
