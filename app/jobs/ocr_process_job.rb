class OcrProcessJob < ApplicationJob
  queue_as :ocr_images

  def perform(image_url)
    tempfile = Down.download(image_url)
    image = RTesseract.new(tempfile.to_path)
    p image.to_s
  end
end
