module Types
  class ItemType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :customer, Types::CustomerType, null: false
  end
end
