require 'spec_helper'


RSpec.describe "testing shared example doubles using instance variables" do

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

  describe "first try (these should pass)" do
    before do
      @contact = double('contact', phone: "+18005551212")
      @collection = double('collection', size: 0)
    end

    include_examples "this uses mocks"
  end

  describe "second try (these should fail)" do
    before do
      @contact = double('contact', phone: nil)
      @collection = double('collection', size: 12)
    end

    include_examples "this uses mocks"
  end

end

RSpec.describe "testing shared example doubles as let() variables" do
  shared_examples "this uses mocks" do
    context "when contact has a phone number" do
      it "returns the phone number" do
        expect(contact.phone).not_to be_nil
      end
    end

    context "when a collection is empty" do
      it "has no members" do
        expect(collection.size).to eq(0)
      end
    end
  end

  describe "first try (these should pass)" do
    let(:contact) { double('contact', phone: "+18005551212") }
    let(:collection) { double('collection', size: 0) }

    include_examples "this uses mocks"
  end

  describe "second try (these should fail)" do
    let(:contact) { double('contact', phone: nil) }
    let(:collection) { double('collection', size: 12) }

    include_examples "this uses mocks"
  end

end
