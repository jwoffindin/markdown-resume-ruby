RSpec::Matchers.define :have_css do |expected|

    chain :with_text do |text|
      @text = text
    end

    match do |actual|
      html = Nokogiri::HTML(actual)
      node = html.at(expected)
      node != nil and (@text.nil? or node.text === @text)
    end
end

