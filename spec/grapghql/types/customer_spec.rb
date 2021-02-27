require 'rails_helper'

describe Types::QueryType do
  let!(:customer) { create(:customer) }
  let!(:items) { create_list(:item, 3, customer: customer) }
  let(:responce) { GraphqlCustomersSchema.execute(query, {}).as_json }

  let(:query) do
    <<-GRAPHQL
      query{
        customer(id: #{customer.id}){
          id
          name
          description
          items {
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
        'customer' => {
            "id" => customer.id.to_s,
            "name" => customer.name,
            "description" => customer.description,
            'items' => [
              {
                'id' => items.first.id.to_s,
                'name' => items.first.name
              },
              {
                'id' => items.second.id.to_s,
                'name' => items.second.name
              },
              {
                'id' => items.third.id.to_s,
                'name' => items.third.name
              }
            ]
          }
      }
    }
  end

  it 'return correct data' do
    expect(responce).to eq(expected_response)
  end
end
