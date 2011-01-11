require 'optparse'
require 'ostruct'
require 'digestif/hasher'
require 'digestif/version'

module Digestif
  class CLI
    def self.run(args)
      new(args).run
    end

    attr_accessor :args, :options

    def initialize(args)
      self.args = args
      self.options = parse_options
    end

    def run
      # validate files first - fail fast
      args.each do |file|
        unless File.exists?(file)
          error "file not found: #{file}"
        end
      end

      # engage hasher
      args.each do |file|
        puts Hasher.new(file, options).digest
      end
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

        p.on_tail("-v", "--version", "Show this message") do
          puts Digestif.version_string
          exit 0
        end

        p.on_tail("-h", "--help", "Show this message") do
          puts p
          exit 0
        end

      end

      begin
        parser.parse!(args)
      rescue OptionParser::ParseError => e
        error e
      end

      options
    end

    def error(error_obj_or_str, code = 1)
      if error_obj_or_str.respond_to?('to_s')
        error_str = error_obj_or_str.to_s
      else
        error_str = error_obj_or_str.inspect
      end

      $stderr.puts "digestif: #{error_str}"
      exit code
    end
  end
end
