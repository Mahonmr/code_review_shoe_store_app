require ('spec_helper')

describe(Shoe) do
  describe('#name') do
    it('will create a instance of a shoe class') do
      shoe = create_shoe
      expect(shoe.brand()).to(eq('Nike'))
    end
  end
end
