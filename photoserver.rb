require 'av_capture'
require 'drb'

class PhotoServer

  attr_reader :photo_request, :photo_response

  def initialize
    @photo_request = Queue.new
    @photo_response = Queue.new
    @mutex = Mutex.new
  end

  def take_photo
    @mutex.synchronize do
      photo_request << 'x'
      photo_response.pop
    end
  end

end
