require './Movie_Data_Dos'
class MovieTest	 

	attr_accessor :tests
	attr_accessor :movie_data_test
	def initialize
		@movie_data_test = Movie_Data_Dos.new("ml-100k", "u1.base")
	end 
	#moviedata = Movie_Data_Dos.new("ml-100k", "u1.base") 
	
	def mean
		mean_array = Array.new 
		mean = 2
		mean_array.push(mean) 
	return mean  
	end 
	def stdev
		stdeviation = 0
		#puts "standard deviation is #{stdeviation}"
		return stdeviation
	end 
	def sqroot

	sqroot = Math.sqrt(mean)
		#puts "the sqroot is #{sqroot}"
		return sqroot
	end

	def to_a(u, m, r)
		movie_test_array = ["the user is #{u}", "the movie is #{m}", "the rating is #{r}", 
			"the prediction is #{@movie_data_test.predict(u,m)}"] 
		puts movie_test_array
	end 

end 

movietest = MovieTest.new 
movietest.stdev 
movietest.mean 
movietest.sqroot
movietest.to_a(1,2,3)
