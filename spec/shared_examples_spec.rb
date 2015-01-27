require 'spec_helper'


RSpec.describe "testing doubles for use in shared examples" do

  shared_examples "this uses mocks" do
    context "when contact has a phone number" do
      it "returns the phone number" do
        expect(@contact.phone).not_to be_nil
      end
    end

    context "when a collection is empty" do
      it "has no members" do
        expect(@collection.size).to eq(0)
      end
    end
  end

  describe "first try" do
    before do
      @contact = double('contact', phone: "+18005551212")
      @collection = double('collection', size: 0)
    end

    include_examples "this uses mocks", @contact, @collection
  end

end
