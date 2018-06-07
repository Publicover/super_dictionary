class WebsterCall < ApplicationRecord
  def self.webster_api(term)
    response = HTTParty.get("http://www.dictionaryapi.com/api/v1/references/collegiate/xml/#{term}?key=#{ENV["WEBSTER_KEY"]}")
    if response.include?("suggestion")
      "FAILED"
    else
      # # defs = []
      # doc_response = Nokogiri::XML(response)
      # doc_response.xpath('//def//dt/text()')#.text.split(':')#.each do |string|
      # #   defs << string.capitalize
      # # end
      # # defs
      # defs = []
      # doc_response = Nokogiri::XML(response)
      # doc_response.xpath('//def//dt').each do |string|
      #   defs << string.text
      # end
      # defs
      defs = []
      doc_response = Nokogiri::XML.parse(response)
      doc_response.css('def').each do |x|
        defs << x.at_css('dt').text
      end
      defs
    end
  end
end
