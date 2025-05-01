# frozen_string_literal: true

RSpec.describe Ductr::Postgres::BasicLookup do
  let(:lookup) { described_class.new("dummy_context", :dummy_method) }
  let(:adapter_double) { instance_double(Ductr::Postgres::Adapter) }

  describe "control registration" do
    let(:registered) { Ductr::Postgres::Adapter.lookup_registry.find(:basic) }

    it "registers as :basic" do
      expect(registered).not_to be_nil
    end

    it "registers the the control class" do
      expect(registered).to eq(described_class)
    end
  end
end
