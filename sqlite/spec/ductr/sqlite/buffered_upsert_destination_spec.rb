# frozen_string_literal: true

RSpec.describe Ductr::SQLite::BufferedUpsertDestination do
  describe "control registration" do
    let(:registered) { Ductr::SQLite::Adapter.destination_registry.find(:buffered_upsert) }

    it "registers as :buffered_upsert" do
      expect(registered).not_to be_nil
    end

    it "registers the the control class" do
      expect(registered).to eq(described_class)
    end
  end
end
