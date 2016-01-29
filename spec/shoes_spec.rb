require ('spec_helper')

describe(ShoeBrand) do
  describe('#name') do
    it('will create a instance of a shoe class') do
      shoe = create_shoe
      expect(shoe.name()).to(eq('Nike'))
    end
  end

  it('will list out shoe brands') do
    expect(ShoeBrand.all.length).to eq(0)
    create_shoe
    create_shoe_two
    expect(ShoeBrand.all.length).to eq(2)
  end

  it('will capitalize the shoe store name') do
    shoe_brand = ShoeStore.create({:name => "nike"})
    expect(shoe_brand.name).to eq("Nike")
    shoe_brand2 = ShoeStore.create({:name => "new Balance"})
    expect(shoe_brand2.name).to eq("New Balance")
    shoe_brand3 = ShoeStore.create({:name => "adiDas"})
    expect(shoe_brand3.name).to eq("Adidas")
  end
end
