# source:  http://screencasts.org/episodes/using-haml-with-rails-3
#  to run this:   rake hamlify:convert
#Include the HTML class
#require 'haml/html'
require 'html2haml/exec'
#require 'haml/erb2haml/railtie' if defined?(Rails)
namespace :hamlify do
  desc "Convert ERB to Haml"
  task :convert => :environment do
    
    #Cycles through the views folder and searches for erb files
    Dir["#{Rails.root}/app/views/**/*.erb"].each do |file_name|
      
      puts "Hamlifying: #{file_name}"
      
      #Creates a new file path for the haml to be exported to
      haml_file_name = file_name.gsub(/erb$/, "haml")
      
      #If haml is missing create it and get rid of the erb
      if !File.exist?(haml_file_name)
        
        #Reads erb from file
        erb_string = File.open(file_name).read
        
        #Converts erb to haml
        #haml_string = Haml::HTML.new(erb_string, :erb => true).render
        haml_string = Html2haml::Exec::HTML2Haml.new(erb_string).parse

        #Writes the haml
        f = File.new(haml_file_name, "w") 
        f.write(haml_string)
   
        #Gets rid of the erb -- we won't get rid of .erb files, but rename instead
        # File.delete(file_name)
        File.rename(file_name, file_name+"orig")
      end
    end
    
  end
end



