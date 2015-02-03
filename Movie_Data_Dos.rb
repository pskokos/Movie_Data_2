require 'csv'
require './MovieData'

#run_test is implemented in MovieTest, which is the movie test 
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

	def self.initialize(file)
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
 		prediction = 0
 		#loop through the array, and determine if the rating exists
 		@movie.each do |row| 
 			if u == row["user_id"].to_i && m == row["movie_id"].to_i
 				prediction += row["rating"].to_i 
 			end  
 		end
 		prediction += 1.0 
 		return prediction
 	end

 	def run_test
 		puts """
 		the movies that are watched by user #{4} are #{movies(4)}
		the viewers of movie #{3} are #{viewers(3)}
		the rating that user #{1} gave movie #{1} is #{rating(1,1)} 
		the predicted rating that user #{1} will give movie #{1} is #{predict(1,1)-1.0} """
 		t = MovieTest.new 
 		puts """
 		the mean is #{t.mean}
 		the standard deviation is #{t.stdev}  
 		the root mean square is #{t.sqroot} """ 
 		t.to_a(1,2,3) 
 		return t 
 	end 
end 

#*****Is this how we were supposed to implement MovieTest instead of a new .rb file?******

class MovieTest	 < Movie_Data_Dos  

	attr_accessor :tests
	attr_accessor :movie_data_test

	def initialize
		@movie_data_test = Movie_Data_Dos.new("ml-100k", "u1.base")
	end 
	
	#this determine the mean by 
	def mean
		predict_var = @movie_data_test.predict(1,2) 
		mean_array = Array.new 
			mean_array.each do |i|
				mean_array.push(mean) 
			end
			predicter = 0
			mean_array.each do mean_array.length
				predicter += mean_array(i)
			end 
		return predicter  
	end 

	def stdev
		
		return stdeviation
	end 
	
	def sqroot
		meansum = 0 
			#mean.each do |i| 
			#meansum += 1 
			#end 
		sqroot = Math.sqrt(meansum)
		return meansum 
	end

	#implements the movie_data_test object and shows the user, rating, and movie to dtermine the prediction
	def to_a(u, m, r)
		movie_test_array = ["the user is #{u}", "the movie is #{m}", "the rating is #{r}", 
			"the prediction is #{@movie_data_test.predict(u,m)}"] 
		puts movie_test_array
	end 
end 

#prints all the data, but not really important for this (just yet)
moviedata = Movie_Data_Dos.new("ml-100k", :u1)
moviedata.load_data
moviedata.run_test
