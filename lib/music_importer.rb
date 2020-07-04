require "pry"

class MusicImporter
    attr_reader :path
  
    def initialize(path)
      @path = path
    end
  
    def files
      @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    end
  
    def import
      files.each{ |f| Song.create_from_filename(f) }
    end
  end



# class MusicImporter
# attr_reader :path 
#     def initialize(path)
#         @path = path 
#     end 
    
#     def files
        
#         @files ||= Dir.glob("#{path}/*mp3").delete_if |word|
#         word.count < 4   
#         binding.pry  
#     end  

#     def import
#         files.each do |file|
#         Song.create_from_filename(file)
#         end  
#     end 
# end 