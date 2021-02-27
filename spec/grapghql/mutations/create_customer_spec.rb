require 'rails_helper'

describe Mutations::CreateCustomer do
  let(:responce) { GraphqlCustomersSchema.execute(query, {}).as_json }

  let(:query) do
    <<-GRAPHQL
      mutation {
        createCustomer(input: { name: "test_name", description: "test_desc"}){
          name
          description
        }
      }
    GRAPHQL
  end

  let(:expected_response) do
    {
      'data' => {
        'createCustomer' => {
          "name" => 'test_name',
          "description" => 'test_desc'
        }
      }
    }
  end

  it 'return correct data' do
    expect(responce).to eq(expected_response)
  end
end
