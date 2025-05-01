# frozen_string_literal: true

RSpec.describe Ductr::SQLite::BasicSource do
  describe "control registration" do
    let(:registered) { Ductr::SQLite::Adapter.source_registry.find(:basic) }

    it "registers as :basic" do
      expect(registered).not_to be_nil
    end

    it "registers the the control class" do
      expect(registered).to eq(described_class)
    end
  end
end
