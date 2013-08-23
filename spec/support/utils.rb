def mkdir(*paths)
  paths.reduce(nil) do |parent, child|
    File.join([parent, child].compact).tap do |path|
      Dir.mkdir(path) rescue nil
    end
  end
end



def stub_template_file(template_content = default_template_content)
  mkdir 'templates', theme
  File.open("templates/#{theme}/index.html", 'w') { |f| f.puts template_content }
end

def stub_css_file(content = '')
  mkdir 'templates', theme, 'css'
  File.open("templates/#{theme}/css/resume.less", 'w') { |f| f.puts content }
end

def stub_resume_file
  File.open(filename, 'w') do |f|
    f.puts "# hello world!"
    f.puts "## I am here"
    f.puts '"quoted"'
  end
end

