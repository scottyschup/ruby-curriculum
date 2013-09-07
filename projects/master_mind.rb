class MasterMind 
  PEGCOLORS = ["red","green","blue","yellow","orange","purple"]
  def initialize
      
  end
  
  def generate_answer
    answer = []
    temp_pegs = PEGCOLORS.dup
    r = Random.new
    4.times do |x|
      new_peg = temp_pegs.sample.dup
      puts new_peg
      answer << new_peg.dup
      temp_pegs.delete(new_peg)
    end
    answer
  end
  
end