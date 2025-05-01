# frozen_string_literal: true

RSpec.describe Ductr::SQLite::BasicDestination do
  describe "control registration" do
    let(:registered) { Ductr::SQLite::Adapter.destination_registry.find(:basic) }

    it "registers as :basic" do
      expect(registered).not_to be_nil
    end

    it "registers the control class" do
      expect(registered).to eq(described_class)
    end
  end
end
