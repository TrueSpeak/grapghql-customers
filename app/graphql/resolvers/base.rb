module Resolvers
  class Base < GraphQL::Schema::Resolver
    argument_class Types::BaseArgument

    def resolve(**options)
      @options = options
      fetch_data
    end

    private

    attr_reader :options

    def fetch_data
      raise NotImplementedError
    end
  end
end
