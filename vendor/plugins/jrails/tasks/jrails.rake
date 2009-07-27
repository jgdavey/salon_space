namespace :jrails do
	namespace :update do
		desc "Copies jRails javascript file to public/javascripts"
		task :javascripts do
			puts "Copying files..."
			project_dir = RAILS_ROOT + '/public/javascripts/'
			scripts = Dir[File.join(File.dirname(__FILE__), '..') + '/javascripts/*.js']
			FileUtils.mkdir(project_dir) unless File.directory?(project_dir)
			FileUtils.cp(scripts, project_dir)
			puts "files copied successfully."
		end
	end
	
	namespace :install do
		desc "Installs jRails javascript file to public/javascripts"
		task :javascripts do
			Rake::Task['jrails:update:javascripts'].invoke
		end
	end
end
