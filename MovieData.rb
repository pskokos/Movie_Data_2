require 'csv'
#NOT FINISHED AT ALL FINDING MY OWN SOLUTIONS  
class MovieData

	#fields used
	attr_accessor :popularity
	attr_accessor :movie
	attr_accessor :popularity_counter
	attr_accessor :movie_file

	def initialize
		#@movie_file = File.new 
		@movie = Array.new #an array that has all of themovie references
	    @popularity = Hash.new #the hash that will be divided into the different rows for the different categories
	
	end 

 	#this will read in the data from 
 	#the original ml-100k files and stores them in whichever 
 	#way it needs to be stored
 	#borrowed from the code that we saw in class, except also includes rating and time stamp rows
 	def load_data
 		
 		#these loops are always confusing, but it's based on columns which are separated in tabs
 		#idea also inspired by this http://www.sitepoint.com/guide-ruby-csv-library-part/
		CSV.foreach('u.data', {col_sep: "\t"}) do |row|
  		row_hash = Hash["user_id", row[0], "movie_id", row[1], "rating", row[2], "time", row[3]]
  		@movie.push(row_hash)	#push the hash into a movie array
		end
		#puts "loaded data"
	 end
	
	#popularity is defined as the number of users a given movie has
	#the movie users a movie has the more popular it has
 	def popularity(movie_id)
 		counter = 0
 		@movie.each do |row| #loops through the rows of movie data 
 			if movie_id == row["movie_id"].to_i #goes to the movie_id hash
 				counter += 1
 			end
 		end 
 		puts "the popularity of #{movie_id} is #{counter}"
 		#return counter 
 	end 

 	def popularity_list 
 		popularity_list = Array.new
 		counter = 0
 		@movie.each do |row| #loops through the rows of movie data 
 			if row["movie_id"].to_i < row["movie_id"].to_i #goes to the movie_id hash
 				counter += 1
 				popularity_list.sort.push(counter)
 			end 
	 		 
	 	end  
	 	 puts "the highest to the lowest movie data is #{popularity_list}"
 	end

 	def similarity(user1, user2)
 		user_1_movies = Array.new 
 		user_2_movies = Array.new 

 		user_1_counter = 0  
 		user_2_counter = 0

 		#loop through the entire array
 		@movie.each do |row|
 			#if user1_id's movie taste matches with user2_id's movie taste 
 			if user1 == row["user_id"].to_i
 				#add how many movies those users add up to 
 				#user_1_movies.push(user1)  
 				user_1_counter += 1
			end 
		end
		@movie.each do |row|
 			#if user1_id's movie taste matches with user2_id's movie taste 
 			if user2 == row["user_id"].to_i
 				#add how many movies those users add up to 
 				user_2_counter += 1
			end 
		end 
		similarity_final = user_1_counter - user_2_counter
 	puts  "The similarity between #{user1} and #{user2} is #{similarity_final}"
 	end  

 	def most_similar(u)

 		@movie2_list = Array.new
 		original_user = u
 		user_x = 0 
 		@movie.each() do |row| 
 			if u == row["user_id"]
 				user_x = u 
 			end 
 		end 
 		puts "The users with the most similar taste with user #{original_user} is user #{user_x}"
 	end 
end 

#prints all the data, but not really important for this (just yet)
#moviedata = MovieData.new 