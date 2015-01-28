require 'csv'
require './MovieData'
#require './MovieTest'
#NOT FINISHED AT ALL FINDING MY OWN SOLUTIONS  
class Movie_Data_Dos < MovieData

	#fields used
	attr_accessor :popularity
	attr_accessor :movie
	attr_accessor :popularity_counter
	attr_accessor :u1 
	
	def initialize(folder, file)
		@movie = Array.new #an array that has all of themovie references
	    @popularity = Hash.new #the hash that will be divided into the different rows for the different categories
		@u1 = file 
	end 

 	#there is an array that is initialized, that is iterated through the movie hash.
 	#For every indicated movie in the array, the users that had that same movie are pushed into the user array
 	def viewers(m)
 		user_array = Array.new 
 		@movie.each do |row|
 			if m.to_i == row["movie_id"].to_i
 				user_array.push(row["user_id"].to_i)
 			end 
 		end 
 		return user_array
 	end 
 	
 	#this is similar to the viewers, except the movies of all the similar users are put into the array
 	def movies(u)
 		movie_array = Array.new   
 		#loop through the array
 		@movie.each do |row|
 			if u.to_i == row["user_id"].to_i
 				movie_array.push(row["movie_id"].to_i)  
 			end 
 		end 
 		return movie_array
 	end 
	
	#this is similar to both previous methods, except it finds the rating that connects with that particular user
 	def rating(u, m)
 		 ratings = 0
 		 @movie.each do |row| #loops through the rows of movie data 
 			if u == row["user_id"].to_i && m == row["movie_id"].to_i #goes to the movie_id hash
 				ratings = row["rating"].to_i  	
 			end
 		end
 		return ratings 
 	end 

 	def predict(u,m)
 		prediction = 0.0
 		@movie.each do |row| 
 			if u == row["user_id"].to_i && row["movie_id"].to_i
 				if rating(u,m) > 3
 					prediction = 4 
 				return prediction
 			elsif rating(u, m) < 3

 				return prediction
 			end 
 		end
 	end

 	def run_test(k)
 		puts "the movies are #{movies(4)}"
		puts "the viewers of movie #{3} are #{viewers(3)}"
		puts "the ratings that user #{1} gave movie #{1} are #{rating(1,1)}" 
		puts "the prediction that user #{1} gave movie #{1} is #{predict(1,1)}" 
 		#t = MovieTest.new 
 		#t.mean
 		#t.stdev 
 		#t.rms 
 	end 
end 

#prints all the data, but not really important for this (just yet)
#moviedata = Movie_Data_Dos.new("ml-100k") 
moviedata = Movie_Data_Dos.new("ml-100k", :u1)
moviedata.load_data
moviedata.run_test(100)
