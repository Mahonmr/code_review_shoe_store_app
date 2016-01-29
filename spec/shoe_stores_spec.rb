require ('spec_helper')

describe(ShoeStore) do
  it('will create an instance of a shoe store class') do
    shoe_store = create_shoe_store
    expect(shoe_store.name).to eq('Nordstom')
  end
end
