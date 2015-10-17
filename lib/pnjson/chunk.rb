module Pnjson
  class Chunk
    attr_accessor :length
    attr_accessor :type
    attr_accessor :data
    attr_accessor :crc

    CRITICAL_CHUNKS_TYPES  = %w( IHDR PLTE IDAT IEND )
    ANCILLARY_CHUNKS_TYPES = %w(bKGD cHRM gAMA hIST iCCP iTXt pHYs sBIT sPLT
                                sRGB sTER tEXt tIME tRNS zTXt)


    def initialize(options = {})
      @length = options[:length]
      @type   = hex_to_ascii(options[:type])
      @data   = options[:data]
      @crc    = options[:crc]
    end

    private
    def hex_to_ascii(str)
      str.scan(/../).map { |x| x.hex.chr }.join
    end
  end
end
