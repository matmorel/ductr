# frozen_string_literal: true

RSpec.describe Ductr::SQLite::MatchLookup do
  describe "control registration" do
    let(:registered) { Ductr::SQLite::Adapter.lookup_registry.find(:match) }

    it "registers as :match" do
      expect(registered).not_to be_nil
    end

    it "registers the the control class" do
      expect(registered).to eq(described_class)
    end
  end
end
