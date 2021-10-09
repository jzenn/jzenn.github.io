require 'nokogiri'
require 'open-uri'
require 'uri'

# this is heavily inspired by https://stackoverflow.com/a/14963269/11262791

module Jekyll

  class RawGithubContent < Liquid::Tag

    def initialize(tag_name, url, tokens)

      # check if the URL is valid
      if url =~ URI::regexp

        # grab the remote document with nokogiri
        #doc = Nokogiri::HTML(open(url))
        doc = Nokogiri::HTML(URI.open(url).read)

        # get the text inside body
        @node = doc.xpath('//text()')

      else 
        @node = 'Could not fetch any content.'
      end

      super
    end

    def render(context)
      output = super
      @node.to_s
    end
  end
end

Liquid::Template.register_tag('remote_file', Jekyll::RawGithubContent)