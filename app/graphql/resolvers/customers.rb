module Resolvers
  class Customers < Resolvers::Base
    type [Types::CustomerType], null: true

    def fetch_data
      ::Customer.all
    end
  end
end
