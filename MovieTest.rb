require './Movie_Data_Dos'
class MovieTest	 

	attr_accessor :tests
	attr_accessor :movie_data_test
	def initialize
		@movie_data_test = Movie_Data_Dos.new("ml-100k", "u1.base")
	end 
	#moviedata = Movie_Data_Dos.new("ml-100k", "u1.base") 
	
	def mean
		#@movie_data_test.predict 
		mean_array = Array.new 
		mean = 0
			mean_array.each do |i|
				mean_array.push(mean) 
			end
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
puts "sqroot is #{movietest.sqroot}" 
movietest.to_a(1,2,3)
