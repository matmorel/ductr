# frozen_string_literal: true

RSpec.describe Ductr::Postgres::BufferedDestination do
  let(:destination) { described_class.new("dummy_context", :dummy_method) }
  let(:adapter_double) { instance_double(Ductr::Postgres::Adapter) }

  describe "control registration" do
    let(:registered) { Ductr::Postgres::Adapter.destination_registry.find(:buffered) }

    it "registers as :buffered" do
      expect(registered).not_to be_nil
    end

    it "registers the the control class" do
      expect(registered).to eq(described_class)
    end
  end
end
