module Types
  class QueryType < Types::BaseObject
    field :customer, resolver: Resolvers::Customer
    field :customers, resolver: Resolvers::Customers
  end
end
