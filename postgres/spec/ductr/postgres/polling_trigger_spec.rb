# frozen_string_literal: true

RSpec.describe Ductr::Postgres::PollingTrigger do
  let(:adapter_double) { instance_double(Ductr::Postgres::Adapter) }
  let(:trigger) { described_class.new(adapter_double) }

  describe "trigger registration" do
    let(:registered) { Ductr::Postgres::Adapter.trigger_registry.find(:polling) }

    it "registers as :polling" do
      expect(registered).not_to be_nil
    end

    it "registers the the trigger class" do
      expect(registered).to eq(described_class)
    end
  end
end
