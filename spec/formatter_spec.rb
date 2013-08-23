# encoding: UTF-8

require 'spec_helper'

require 'resume_formatter'

describe ResumeFormatter do

  let(:theme) { 'blockish' }
  let :formatter do
    described_class.new(theme)
  end

  subject { formatter }

  describe '#asset_path' do
    its(:asset_path) { should == 'templates/blockish' }
    it('takes optional arguments') do
      subject.asset_path('css').should == 'templates/blockish/css'
    end
  end

  describe '#css' do
    context 'theme exists' do
      its(:css) { should include 'font-family' }
    end
  end

  describe '#to_help', fakefs: true do

    let(:filename) { 'resume.md' }

    let(:late_template_content) {
      "<title>{{title}}</title>\n{{{resume}}}\n"
    }

    before do 
      stub_resume_file
      stub_css_file
    end

    let(:formatted) { formatter.to_html(filename) }

    it 'renders resume as markdown' do
      stub_template_file('{{{resume}}}')
      formatted.should have_css('h1').with_text('hello world!')
    end

    it 'pretty formats quotes' do
      stub_template_file('{{{resume}}}')
      formatted.should have_css('p').with_text('“quoted”')
    end

    it 'sets html title to be h1 | h2' do
      stub_template_file('<title>{{title}}</title>')
      formatted.should have_css('title').with_text('hello world! | I am here')
    end

    it 'inserts css rendered by less' do
      stub_template_file('<style type="text/css">{{{style}}}</style>')
      stub_css_file('p { font-size: (1+1)}')
      formatted.should have_css('style').with_text("p {\n  font-size: 2;\n}\n")
    end

  end
end

