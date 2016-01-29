require ('spec_helper')

describe(ShoeBrand) do
  describe('#name') do
    it('will create a instance of a shoe class') do
      shoe = create_shoe
      expect(shoe.name()).to(eq('Nike'))
    end
  end
end
