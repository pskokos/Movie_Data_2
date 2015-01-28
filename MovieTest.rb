require './Movie_Data_Dos'
class MovieTest	 

	#moviedata = Movie_Data_Dos.new("ml-100k", "u1.base") 
	def mean
		pred = 0
		error = pred/100
		return pred
		puts "the prediction is #{pred}"
	end 

	def stdev
		stdeviation = 0
		puts "#{stdeviation}"
		return stdeviation
	end 

	def rms
		mean 
		sqroot = Math.sqrt(mean)
		puts "the sqroot is #{sqroot}"
		return rms 
	end

	def to_a
		movie_test_array = []#{user}, #{ratings}, #{prediction(m)}, #{prediction(p)}] 
		#puts movie_test_array 
	end 
end 
