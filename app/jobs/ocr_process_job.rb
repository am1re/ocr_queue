class OcrProcessJob < ApplicationJob
  queue_as :ocr_images

  rescue_from OcrProcessor::OcrProcessError do |e|
    Sneakers.logger.info "[OcrProcessJob(#{job_id[0, 8]})] error processing job (#{e.message})"
  end

  def perform(image_url)
    result = OcrProcessor.process image_url
    Sneakers.logger.info "[OcrProcessJob(#{job_id[0, 8]})] result =>\n#{result}"
    result
  end
end
