require 'json'
require 'pnjson/chunk'
require 'pnjson/error'

module Pnjson
  class Pnjson
    attr_accessor :header
    attr_accessor :chunks

    HEADER_PNG = "89504e470d0a1a0a"

    def initialize(filename)
      raw = File.open(filename).read
      hex_png = ascii_to_hex(raw)

      raise Error::InvalidPng unless valid_png?(hex_png)

      @header = hex_png.shift(8).join
      @chunks = chunkify(hex_png)
    end

    def jsonify
      self.to_json
    end

    def valid_png?(hex_png)
      hex_png[0..7].join == HEADER_PNG
    end

    def chunkify(array)
      return [] if array.empty?
      length = convert_base(array.shift(4).join, 16, 10).to_i

      [Chunk.new({
        length: length,
        type: array.shift(4).join,
        data: array.shift(length).join,
        crc: array.shift(4).join
      }), chunkify(array)].flatten
    end

    private

    def ascii_to_hex(raw_str)
      raw_str.each_byte.map do |byte|
        b = byte.to_s(16)
        b.length == 1 ? "0#{b}" : b
      end
    end

    def convert_base(str, from, to)
      str.to_i(from).to_s(to)
    end
  end

  def open(filename)
    Pnjson.new(filename)
  end
end
