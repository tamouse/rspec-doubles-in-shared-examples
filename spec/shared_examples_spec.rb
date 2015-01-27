require 'spec_helper'


RSpec.describe "testing doubles for use in shared examples" do

  shared_examples "this uses mocks" do |mock_with_phone, mock_is_a_collection|
    context "when mock_with_phone has a phone number" do
      it "returns the phone number" do
        expect(mock_with_phone.phone).not_to be_nil
      end
    end

    context "when mock_with_phone does not have a phone" do
      it "raises an error" do
        expect {mock_with_phone.phone }.to raise_error
      end
    end

    context "when mock_with_collection is empty" do
      it "has no members" do
        expect(mock_is_a_collection.size).to eq(0)
      end
    end

    context "when mock_with_collection is not empty" do
      it "has members" do
        expect(mock_is_a_collection.size).not_to eq(0)
      end
    end
  end

  describe "first try" do
    let!(:contact) { double('contact with phone', phone: "+18005551212") }
    let!(:collection) { double('collection', size: 0) }

    include_examples "this uses mocks", contact, collection
  end

end
