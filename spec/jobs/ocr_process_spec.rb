require 'rails_helper'

RSpec.describe OcrProcessJob, type: :job do
  describe '#perform_later' do
    it 'enqueues ocr process job' do
      ActiveJob::Base.queue_adapter = :test
      OcrProcessJob.perform_later('cats')
      expect(OcrProcessJob).to have_been_enqueued
    end
  end
end
