RSpec.describe OcrProcessor do
  describe '#process' do
    context 'given valid image url' do
      before do
        @url = 'https://img.test.test/vi/1231123/0.jpg'
        image = File.read('spec/fixtures/images/testimage1.jpg')
        stub_request(:get, @url)
          .to_return(
            status: 200,
            body: image,
            headers: { 'Content-Type' => 'image/jpg' }
          )
      end
      it 'returns text extracted by OCR from image' do
        expect(OcrProcessor.process(@url)).not_to be(nil)
      end
    end

    context 'given unexistent image url' do
      before do
        @url = 'https://img.test.test/vi/1231123/0.jpg'
        stub_request(:get, @url)
          .to_return(
            status: 404
          )
      end
      it 'raises error' do
        expect do
          OcrProcessor.process @url
        end.to raise_error(OcrProcessor::OcrProcessError)
      end
    end
  end
end
