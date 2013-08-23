require 'maruku'
require 'rubypants'
require 'nokogiri'
require 'less'
require 'mustache'

ResumeFormatter = Struct.new(:theme) do

  def to_html(filename)
    rendered = render_markdown_file(filename)
    title = extract_title(rendered)
    Mustache.render(template, resume: rendered, title: title, style: css)
  end

  def css
    parser = Less::Parser.new(paths: [asset_path('css')])
    parser.parse(full_css_import).to_css
  end

  def extract_title(html_doc)
    dom = Nokogiri::HTML(html_doc)
    [dom.at('h1').text, dom.at('h2')].join(' | ')
  end

  def asset_path(*paths)
    File.join('templates', theme.to_s, *paths)
  end

  def template
    File.read(asset_path 'index.html')
  end

  def render_markdown_file(filename)
    markdown = File.read(filename)
    html = Maruku.new(markdown).to_html
    RubyPants.new(html).to_html
  end

  def full_css_import
    %w[normalize elements resume screen pdf].map{|css| "@import '#{css}';"}.join("\n")
  end

end
