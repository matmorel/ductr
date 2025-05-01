# frozen_string_literal: true

RSpec.describe Ductr::SQLite::BufferedLookup do
  describe "control registration" do
    let(:registered) { Ductr::SQLite::Adapter.lookup_registry.find(:buffered) }

    it "registers as :buffered" do
      expect(registered).not_to be_nil
    end

    it "registers the the control class" do
      expect(registered).to eq(described_class)
    end
  end
end
