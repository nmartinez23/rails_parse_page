class PagesController < ApplicationController

  class Page
    attr_reader :header_one
    attr_reader :header_two
    attr_reader :header_three
    attr_reader :links

    def initialize(header_one, header_two, header_three, links)
      @header_one = header_one
      @header_two = header_two
      @header_three = header_three
      @links = links
    end
  end

  def index_content
    require 'open-uri'
    # doc = Nokogiri::HTML(open(self.page_url))
    doc = Nokogiri::HTML(open("https://techcrunch.com"))
    entries = doc.css('body')
    @entriesArray = []

    entries.each do |entry|
      head_one = entry.css('h1').map { |header| header.text }
      header_one = "H1 " + head_one.join(" - ")

      head_two = entry.css('h2').map { |header| header.text }
      header_two = "H2 " + head_two.join(" - ")

      head_three = entry.css('h3').map { |header| header.text }
      header_three = "H3 " + head_three.join(" - ")

      links = entry.css('a').map { |link| link['href'] }

      @entriesArray << Page.new(header_one, header_two, header_three, links)
    end

    render template: 'pages/page_content'
  end
end
