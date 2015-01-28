#require './Movie_Data_Dos'
class MovieTest	 

	#moviedata = Movie_Data_Dos.new("ml-100k", "u1.base") 
	def mean
		mean_array = Array.new 
		pred = 0
		mean_array.push("results")
			mean_array.each do |i| 
				puts mean_array
			end  
		
		puts "the prediction is #{pred}"
		return pred
		
	end 

	def stdev
		stdeviation = 0
		puts "standard deviation is #{stdeviation}"
		#return stdeviation
	end 

	def rms
		mean 
		sqroot = Math.sqrt(mean)
		puts "the sqroot is #{sqroot}"
		#return rms 
	end

	def to_a
		u =0
		m = 0
		r = 0
		p = 0
		movie_test_array = ["the user is #{u}", "the movie is #{m}", "the rating is #{r}", 
			"the prediction is #{p}"] 
		puts movie_test_array
	end 
end 


