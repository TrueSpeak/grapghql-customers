module Types
  class CustomerType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :description, String, null: true
    field :items, [Types::ItemType], null: true
  end
end
