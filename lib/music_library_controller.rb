

require "pry"

class MusicLibraryController
    def initialize(path="./db/mp3s")
        MusicImporter.new(path).import 
    end  

    def call
        input = ""
        while input != "exit"
            puts "Welcome to your music library!"  
            puts "To list all of your songs, enter 'list songs'."
            puts "To list all of the artists in your library, enter 'list artists'."
            puts "To list all of the genres in your library, enter 'list genres'."
            puts "To list all of the songs by a particular artist, enter 'list artist'."
            puts "To list all of the songs of a particular genre, enter 'list genre'."
            puts "To play a song, enter 'play song'."
            puts "To quit, type 'exit'."
            puts "What would you like to do?"
        input = gets.strip 
            case input 
            when 'list songs'
                list_songs 
            when 'list artists'
                list_artists
            when 'list genres'
                list_genres 
            when 'list artist'
                list_songs_by_artist
            when 'list genre'
                list_songs_by_genre
            when 'play song'
                play_song
            when 'exit'
                "goodbye" 
            end 
        end 
    end 

    def list_songs
        sorted_songs = Song.all.sort_by do |song_name|
            song_name.name
        end 
        counter = 1  
        sorted_songs.each do |song|    
            puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
            counter +=1 
        end 
    end 
  
    def list_artists
        sorted_artists = Artist.all.sort_by do |artist|
            artist.name 
        end 
        counter = 1  
        sorted_artists.each do |song|
            puts "#{counter}. #{song.name}"
            counter +=1  
        end 
    end 

    def list_genres
        sorted_genres = Genre.all.sort_by do |genre|
            genre.name 
        end 
        counter = 1  
        sorted_genres.each do |genre|
            puts "#{counter}. #{genre.name}"
            counter +=1  
        end 
    end 

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        response = gets.strip 

        if new_artist = Artist.find_by_name(response)
        sorted_songs = new_artist.songs.sort_by do |song|
            song.name
        end   
        
        counter = 1  
        sorted_songs.each do |song|
            puts "#{counter}. #{song.name} - #{song.genre.name}"
            counter +=1  
        end 
    end
end 



    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        response = gets.strip 
        if new_genre = Genre.find_by_name(response)
            sorted_genres = new_genre.songs.sort_by do |genre|
                genre.name
            end
            counter = 1
            sorted_genres.each do |genre|
                puts "#{counter}. #{genre.artist.name} - #{genre.name}"
                counter +=1
            end
        end
    end 





    def play_song
        puts "Which song number would you like to play?"
    
        input = gets.strip.to_i
        if (1..Song.all.length).include?(input)
          song = Song.all.sort{ |a, b| a.name <=> b.name }[input - 1]
        end
    
        puts "Playing #{song.name} by #{song.artist.name}" if song
      end
    end







# def play_song
#     puts "Which song number would you like to play?"
#     input = gets.strip.to_i 
#     if input == 1..Song.all.length
#         song = Song.all.sort

#     input = gets.strip.to_i
#     if (1..Song.all.length).include?(input)
#       song = Song.all.sort{ |a, b| a.name <=> b.name }[input - 1]
#     end
#   end 
#   puts "Playing #{song.name} by #{song.artist.name}" if song
# end 
# end 
        
# # sorted_genres = new_genre.songs.sort_by do |genre|
# #     genre.name
# # end   
# # expected: ("1. Real Estate - It's Real") 


# # def list_songs_by_artist
# #     puts "Please enter the name of an artist:"
# #     input = gets.strip

# #     if artist = Artist.find_by_name(input)
# #       artist.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
# #         puts "#{i}. #{s.name} - #{s.genre.name}"
# #       end
# #     end
# #   end