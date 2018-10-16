require "rails_helper"

# validates :name, presence: true
# validates :price, presence: true
# validates :quantity, presence: true
# validates :category, presence: true

RSpec.describe Product, type: :model do
  let(:category) { Category.new(:name => "Cat 1") }
  subject {
    described_class.new(name: "Anything", price: 100,
                        quantity: 1, category: category)
  }
  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    # it "is valid without a price (BAD)" do
    #   subject.price = nil
    #   expect(subject).to be_valid
    # end
    # it "is not valid without a price" do
    #   subject.price = nil
    #   expect(subject).to_not be_valid
    # end

    it "is not valid without a price" do
      # NB: because the monetize library doesn't let me set .price=nil, 
      #        I chose this rococo workaround with .price_cents=nil
      expect(subject.price).to_not be(nil)  # because of our before-setup
      subject.price_cents = nil
      expect(subject.price).to be(nil)      # look, setting price_cents actually worked
      expect(subject).to_not be_valid
    end
    it "is not valid without a price (2)" do
      # Because of quirks in the monetize library, I'm going to recreate the whole testing
      # object, isntead of setting price=nil, because setting price=nil doesn't work.  So dumb.
      s2 = described_class.new(name: subject.name, price: nil, quantity: subject.quantity, category: subject.category)
      expect(subject).to_not be_valid
    end
    it "is not valid without a quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a category" do
      subject.category = nil
      expect(subject).to_not be_valid
    end
  end
end
