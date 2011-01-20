require 'digest/sha1'
require 'digest/md5'

module Digestif
  class Hasher

    attr_accessor :options, :filename

    def initialize(filename, options = CLI.default_options)
      self.filename = filename
      self.options = options
    end

    def digest
      hasher = Digest.const_get(options.digest.to_s.upcase).new

      File.open(filename, 'rb') do |f|
        until f.eof
          hasher.update(f.read(options.read_size))
          f.seek(options.seek_size, IO::SEEK_CUR)
        end
      end
      hasher.hexdigest
    end


  end
end
