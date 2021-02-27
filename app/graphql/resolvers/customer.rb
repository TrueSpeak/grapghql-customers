module Resolvers
  class Customer < Resolvers::Base
    argument :id, ID, required: true

    type Types::CustomerType, null: true

    def fetch_data
      ::Customer.find_by(id: options[:id])
    end
  end
end
