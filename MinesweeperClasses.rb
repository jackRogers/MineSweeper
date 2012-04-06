#MineSweeper
#classes v0.1
#By Jack Rogers

class tile
{

	attr_accessor x
	attr_accessor :y
	attr_accessor :value

	def initialize(x,y,value)
		@@x = x 		#x coordinate
		@@y = y			#y coordinate
		@@value = value #0-8 if not a mine, "*" if mine
	
	end
		
}

class board
{

	attr_accessor :x, :y, :m, :board

	def initialize(x,y,m)
		@@board = makeBoard(x,y,m,0)	#fourth argument sets all elements of board to 0
		
	end
		
	def makeBoard(x,y,mines,initer)
		board = Array.new(y)
		board.size.times {|lolcat| board[lolcat] = Array.new(x,initer)}
		placed = 0
		while placed < mines do
			xpos = rand(x)
			ypos = rand(y)
			if board[xpos][ypos] == 0
				board[xpos][ypos] = "*"
				placed += 1
				#pop board as we place mines?
			elsif board[xpos][ypos] == "*"
				#print "already a mine here"
			else 
				print "Something went wrong"
				break
			end 
		end
		return board
	end

}

class maskboard
{

}

class player
{

}




