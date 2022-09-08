class Api::V1::MediaProcessController < ApplicationController
  def receive
    OcrProcessJob.perform_later(params[:fileUrl]) if valid_url? params[:fileUrl]
  end

  private

  def valid_url?(url)
    url =~ /\A#{URI::DEFAULT_PARSER.regexp[:ABS_URI]}\z/
  end
end
