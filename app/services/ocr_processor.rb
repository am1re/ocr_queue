class OcrProcessor
  class OcrProcessError < StandardError; end

  def self.process(image_url)
    tempfile = Down.download(image_url)
    RTesseract.new(tempfile.to_path).to_s
  rescue Down::Error => e
    raise OcrProcessError, e
  end
end
