class OcrProcessJob < ApplicationJob
  queue_as :ocr_images

  def perform(image_url)
    tempfile = Down.download(image_url)
    image = RTesseract.new(tempfile.to_path)
    result = image.to_s
    logger.info "[OcrProcessJob(#{job_id[0, 8]})] result =>\n#{result}"
  rescue Down::Error => e
    logger.info "[OcrProcessJob(#{job_id[0, 8]})] error downloading file (#{e.message})"
  end
end
