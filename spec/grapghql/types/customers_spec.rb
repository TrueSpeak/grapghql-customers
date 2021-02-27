require 'rails_helper'

describe Types::QueryType do
  let!(:customers) { create_list(:customer, 3) }
  let(:responce) { GraphqlCustomersSchema.execute(query, {}).as_json }

  let(:query) do
    <<-GRAPHQL
      query{
        customers{
          id
          name
          description
        }
      }
    GRAPHQL
  end

  let(:expected_response) do
    {
      'data' => {
        'customers' => [
          {
            "id" => customers.first.id.to_s,
            "name" => customers.first.name,
            "description" => customers.first.description
          },
          {
            "id" => customers.second.id.to_s,
            "name" => customers.second.name,
            "description" => customers.second.description
          },
          {
            "id" => customers.third.id.to_s,
            "name" => customers.third.name,
            "description" => customers.third.description
          }
        ]
      }
    }
  end

  it 'return correct data' do
    expect(responce).to eq(expected_response)
  end
end
