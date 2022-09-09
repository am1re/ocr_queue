class Api::V1::MediaProcessController < ApplicationController
  rescue_from ActionController::ParameterMissing do |e|
    render json: { message: e.message }, status: :bad_request
  end

  rescue_from Bunny::TCPConnectionFailedForAllHosts do
    render json: { message: 'connection to RabbitMQ failed' }, status: :internal_server_error
  end

  def receive
    if valid_file_url? file_url_param
      OcrProcessJob.perform_later file_url_param
    else
      render json: { message: 'invalid fileUrl, jpg/jpeg/png are supported' }, status: :bad_request
    end
  end

  private

  def valid_file_url?(url)
    url =~ /\A#{URI::DEFAULT_PARSER.regexp[:ABS_URI]}\z/ &&
      File.extname(URI.parse(url).path) =~ /^(.png|.jpg|.jpeg)$/
  end

  def file_url_param
    params.require(:fileUrl)
  end
end
