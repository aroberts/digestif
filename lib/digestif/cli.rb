require 'optparse'
require 'ostruct'

module Digestif
  class CLI
    def self.run(args)
      new(args).run
    end

    attr_accessor :args, :options

    def initialize(args)
      self.args = args
    end

    def run
      # engage hasher
      self.options = parse_options
    end

    def parse_options
      # defaults
      options = OpenStruct.new
      options.digest = :sha1
      
      parser = OptionParser.new do |p|
        p.banner = "Usage: digestif [options] filename"

        p.separator ""
        p.separator "Options:"
        p.separator ""

        p.on("-d", "--digest DIGEST", [:md5, :sha1],
             "Digest algorithm to use.  Currently supported:",
             "  md5", "  sha1", ' ') do |digest|
          options.digest = digest
             end

        p.on_tail("-h", "--help", "Show this message") do
          puts p
          exit 0
        end

      end

      begin
        parser.parse!(args)
      rescue OptionParser::ParseError => e
        puts "digestif: #{e.to_s}"
        exit 1
      end

      options
    end
  end
end
