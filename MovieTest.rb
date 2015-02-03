require './Movie_Data_Dos'

#this class has the methods initialize, which creates a movie_data_dos file from the loaded ruby file
#as well as "mean", which is implemented using th movie_data_test object created, and the stdev, and sqroot methods
#that utilizes the product of the mean method 

class MovieTest	 < Movie_Data_Dos  

	attr_accessor :tests
	attr_accessor :movie_data_test
	def initialize
		@movie_data_test = Movie_Data_Dos.new("ml-100k", "u1.base")
	end 
	
	#this determins the mean by 
	def mean
		mean = @movie_data_test.predict(1,2) 
		mean_array = Array.new 
			mean_array.each do |i|
				mean_array.push(mean) 
			end
			#puts "the mean is #{mean_array}"
		return mean_array  
	end 

	def stdev
		stdeviation = 0
		#puts "standard deviation is #{stdeviation}"
		return stdeviation
	end 
	
	def sqroot
		meansum = 0 
			mean.each do |i| 
			meansum += 1 
			end 
		sqroot = Math.sqrt(meansum)
		#mean**
		#puts "the sqroot is #{sqroot}"
		return sqroot
	end

	#implements the movie_data_test object and shows the user, rating, and movie to dtermine the prediction
	def to_a(u, m, r)
		movie_test_array = ["the user is #{u}", "the movie is #{m}", "the rating is #{r}", 
			"the prediction is #{@movie_data_test.predict(u,m)}"] 
		puts movie_test_array
	end 

end 

movietest = MovieTest.new 
puts "the movietest standard deviation is #{movietest.stdev}"  
puts "the mean is #{movietest.mean}"  
puts "sqroot is #{movietest.sqroot}" 
movietest.to_a(1,2,3)
