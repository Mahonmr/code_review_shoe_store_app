require ('spec_helper')

describe(ShoeStore) do
  it('will create an instance of a shoe store class') do
    shoe_store = create_shoe_store
    expect(shoe_store.name).to eq('Nordstom')
  end

  it('will list out stores') do
    expect(ShoeStore.all.length).to eq(0)
    create_shoe_store
    create_shoe_store_two
    expect(ShoeStore.all.length).to eq(2)
  end

  it('will update a shoe store') do
    shoe_store = create_shoe_store
    expect(shoe_store.name).to eq('Nordstom')
    shoe_store.update(name: 'Nordstrom Store')
    expect(shoe_store.name).to eq('Nordstrom Store')
  end

  it('will delete a shoe store') do
    shoe_store = create_shoe_store
    shoe_store_two = create_shoe_store_two
    expect(ShoeStore.all.length).to eq(2)
    shoe_store.destroy
    expect(ShoeStore.all.length).to eq(1)
  end

  it('will capitalize the shoe store name') do
    shoe_store = ShoeStore.create({:name => "portland running company"})
    expect(shoe_store.name).to eq("Portland Running Company")
    shoe_store2 = ShoeStore.create({:name => "PortLand Running company"})
    expect(shoe_store2.name).to eq("Portland Running Company")
  end
end
