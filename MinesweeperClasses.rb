#MineSweeper
#classes v0.1
#By Jack Rogers


#class representing each game tile
class Tile

	#lets us access instance variables
	attr_accessor :x, :y, :m, :seen

	#new instance function
	def initialize(x,y,value,seen=False)
		@x = x 		#x coordinate
		@y = y			#y coordinate
		@value = value #0-8 if not a mine, "*" if mine
		@seen = seen   #whether has been viewed or not.  should be stored only in maskboard
	end
		
end		
	
#class representing the game board	
class Board

	#lets us access instance variables
	attr_accessor :x,:y,:m,:board

	#new instance function
	def initialize(x,y,m)
		@x = x							#horizonal size
		@y = y							#vertical size
		@m = m							#number of mines
		@board = makeBoard()
		@board2 = popBoard()
		
	end
		
	#old makeBoard Function
	def makeBoard()
		board = Array.new(@y)
		board.size.times {|lolcat| board[lolcat] = Array.new(@x,0)}
		placed = 0
		while placed < @m do
			xpos = rand(@x)
			ypos = rand(@y)
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
		@board = board
	end
	
	def checker(i,j)
	# This function is very redundant and can be written better by a few smaller sub functions to avoid repetetive code
		#Check up
			if @board[i][j] == "*"
				return @board
				end
		
			if j == 0
				print ""
			elsif @board[i][j-1] == "*"
				@board[i][j] += 1
				end
			
		#Check down
			if j == @y - 1
				print ""
			elsif @board[i][j+1] == "*"
				@board[i][j] += 1
				end
				
		#Check left
			if i == 0
				print ""
			elsif @board[i-1][j] == "*"
				@board[i][j] += 1
				end
				
		#Check right
			if i == @x - 1
				print ""
			elsif @board[i+1][j] == "*"
				@board[i][j] += 1
				end
		
		#Check up-left
			if i == 0
				print ""
			elsif j == 0
				print ""
			elsif @board[i-1][j-1] == "*"
				@board[i][j] += 1
				end
		
		#Check up-right
			if i == @x - 1
				print ""
			elsif j == 0
				print ""
			elsif @board[i+1][j-1] == "*"
				@board[i][j] += 1
				end
		
		#Check down-left
			if i == 0
				print ""
			elsif j == @y - 1
				print ""
			elsif board[i-1][j+1] == "*"
				board[i][j] += 1
				end
		
		#Check down-right
			if i == @x - 1
				print ""
			elsif j == @y - 1
				print ""
			elsif @board[i+1][j+1] == "*"
				@board[i][j] += 1
				end
	
	return board
	
	end
	
	def popBoard()
		intermediateBoard = @board
		@x.times { |i| @y.times { |j| intermediateBoard = checker(i,j) }
		}
		return 
		
		@board = intermediateBoard
				
	end
	
	def pprintboard()
		print "\n\n\n"
		what = @x
		huh = @y
		what.times {|i| huh.times {|j| if @board[i][j] == 0
											print " " 
										elsif @board[i][j] == "*"
											print "* " 						
										else 
											print @board[i][j]
											print " " 
										end}
										print "\n" }	
		print "\n\n\n"
		end
	
	
end


#class representing the board that the player can see
class Maskboard
end

#class that represents the player that interacts with the board
class Player
end


lol = Board.new(10,10,10)
print lol.x, " xsize \n"
print lol.y, " ysize \n"
print lol.m, " mines \n"
lol.pprintboard()

