require 'digest/sha1'
require 'digest/md5'

module Digestif
  class Hasher

    attr_accessor :options, :filename

    def initialize(filename, options)
      self.filename = filename
      self.options = options
    end

    def digest
      hasher = Digest.const_get(options.digest.to_s.upcase).new

      seek_size = 4
      read_size = 7

      File.open(filename, 'rb') do |f|
        until f.eof
          hasher.update(f.read(read_size))
          f.seek(seek_size, IO::SEEK_CUR)
        end
      end
      hasher.hexdigest
    end


  end
end
