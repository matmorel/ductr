# frozen_string_literal: true

RSpec.describe Ductr::SQLite::PollingTrigger do
  let(:adapter_double) { instance_double(Ductr::SQLite::Adapter) }
  let(:trigger) { described_class.new(adapter_double) }

  describe "#stop" do
    before do
      allow(adapter_double).to receive(:close!)

      trigger.stop
    end

    it "closes the adapter" do
      expect(adapter_double).to have_received(:close!)
    end
  end

  describe "#callable" do
    let(:scheduler) { instance_double(Ductr::Scheduler) }
    let(:method_double) { instance_double(Method) }
    let(:handler_double) { instance_double(Ductr::SequelBase::PollingHandler) }

    before do
      allow(Ductr::SequelBase::PollingHandler).to receive(:new).and_return(handler_double)
    end

    it "creates a PollingHandler" do
      trigger.send(:callable, method_double)
      expect(Ductr::SequelBase::PollingHandler).to have_received(:new).with(method_double, adapter_double)
    end

    it "returns the handler" do
      expect(trigger.send(:callable, method_double)).to be(handler_double)
    end
  end
end
