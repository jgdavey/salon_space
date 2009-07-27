# Install hook code here
puts "Copying files..."
dir = "javascripts"
["jrails.js"].each do |js_file|
  dest_dir = File.join(RAILS_ROOT, "public", dir)
	dest_file = File.join(dest_dir, js_file)
	src_file = File.join(File.dirname(__FILE__) , dir, js_file)
	FileUtils.mkdir(dest_dir) unless File.directory?(dest_dir)
	FileUtils.cp_r(src_file, dest_file)
	puts "\tcopied: #{dest_file}"
end
puts "Files copied - Installation complete!"
