require 'spec_helper'
require 'delegate_to_instance'

class DummyHTMLSanitizer
  extend DelegateToInstance
  delegate_to_instance :sanitize

  def initialize(html)
    @html = html
  end

  def sanitize
    @html
  end
end

describe DelegateToInstance do
  let(:html) { '<p>Overpriced coffee, awesome!</p>' }
  let(:sanitizer) { DummyHTMLSanitizer.new(html) }

  it 'creates an instance' do
    expect(DummyHTMLSanitizer).to receive(:new).with(html).once.and_return(sanitizer)
    DummyHTMLSanitizer.sanitize(html)
  end

  it 'delegates method to that instance' do
    expect(DummyHTMLSanitizer).to receive(:new).with(html).once.and_return(sanitizer)
    expect(sanitizer).to receive(:sanitize).once
    DummyHTMLSanitizer.sanitize(html)
  end
end
