require 'rails_helper'

describe Mutations::CreateItem do
  let!(:customer) { create(:customer) }
  let(:responce) { GraphqlCustomersSchema.execute(query, {}).as_json }

  let(:query) do
    <<-GRAPHQL
      mutation {
        createItem(input: { name: "test_name", customerId: #{customer.id}}){
          name
          customer {
            id
            name
          }
        }
      }
    GRAPHQL
  end

  let(:expected_response) do
    {
      'data' => {
        'createItem' => {
          "name" => 'test_name',
          "customer" => {
            "id" => customer.id.to_s,
            "name" => customer.name
          }
        }
      }
    }
  end

  it 'return correct data' do
    expect(responce).to eq(expected_response)
  end
end
