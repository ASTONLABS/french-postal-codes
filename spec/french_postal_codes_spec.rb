require "spec_helper"
require "french_postal_codes"

describe FrenchPostalCode do

  before(:all) do
    FrenchPostalCode.load_paths << File.join(File.dirname(__FILE__), "data")
  end

  [:cities, :places].each do |method|
    context ".#{method.to_s}" do
      it "returns cities for that code if there are any" do
        expect(FrenchPostalCode.send(method, "existing")).to eq %w(First Second)
      end

      it "returns empty array if code doesn't exists" do
        expect(FrenchPostalCode.send(method, "nonexisting").count).to eq 0
      end
    end
  end

end