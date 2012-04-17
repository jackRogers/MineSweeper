#MineSweeper
#classes v0.1
#By Jack Rogers

#class representing the game board	
class Board

	#lets us access instance variables
	attr_accessor :x,:y,:m,:board,:mask

	#new instance function
	def initialize(x,y,m)
		@x = x							#horizonal size
		@y = y							#vertical size
		@m = m							#number of mines
		@board = makeBoard()
		popBoard()
		@mask = makeMaskBoard()
	end
		
	#makeBoard Function
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
		return board
	end
	
	#function that checks neighbors of a given tile to set value of each tile propperly
	def checker(i,j)
	# This function is very redundant and can be written better by a few smaller sub functions to avoid repetetive code
		#Check up
			if @board[i][j] == "*"
				return nil
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
	
	#runs checker on each tile
	def popBoard()
		@x.times { |i| @y.times { |j| checker(i,j) }
		}
				
	end
	
	#makes the minesweeper board that the player sees
	def makeMaskBoard()
		board = Array.new(@y)
		board.size.times {|lolcat| board[lolcat] = Array.new(@x,nil)}
		return board
		end
		
	#reveals tiles on the mask board
	def reveal(i,j)
		if @mask[i][j] == nil
			print "new",i,j,"\n"
			#if mine
			if @board[i][j] == "*"
				@mask[i][j] = @board[i][j]
				print "YOU LOSE"
			#if number
			elsif @board[i][j] != 0
				@mask[i][j] = @board[i][j]
			#if empty
			elsif @board[i][j] == 0
				@mask[i][j] = @board[i][j]
				#reveal every non-border tile around tile
				
				#reveal up
				if j == 0
				else
					#print i,j,"revealed",i,j-1,"\n"
					reveal(i,j-1)
					end
				
				#reveal down
				if j == @y-1
					print ""
				else
					print ""
					reveal(i,j+1)
					end
				
				#reveal left
				if i == 0
					print ""
				else
					print ""
					reveal(i-1,j)
					end
				
				#reveal right
				if i == @x-1
					print ""
				else
					print ""
					reveal(i+1,j)
					end
				#reveal upleft
		
				if i == 0
					print ""
				elsif j == 0
					print ""
				else
					print ""
					reveal(i-1,j-1)
					end
			#Check up-right
				if i == @x - 1
					print ""
				elsif j == 0
					print ""
				else
					print ""
					reveal(i+1,j-1)
					end
			
			#Check down-left
				if i == 0
					print ""
				elsif j == @y - 1
					print ""
				else
					print ""
					reveal(i-1,j+1)
					end
			#Check down-right
				if i == @x - 1
					print ""
				elsif j == @y - 1
					print ""
				else
					print ""
					reveal(i+1,j+1)
					
				end
		else
			print "seen"
		end
	end
	end
		
	#flags a tile instead of revealing it
	def flag
	
		end
	#pretty print the board
	def pprintboard(board)
		print "\n\n\n"
		@x.times {|i| @y.times {|j| if board[i][j] == 0
											print ".\t" 
										elsif board[i][j] == "*"
											print "*\t" 						
										else 
											print board[i][j]
											print " \t" 
										end}
										print "\n" }	
		print "\n\n\n"
		end
	
end

#class that represents the player that interacts with the board
class Player
	attr_accessor
	
	#initializes a new player instance
	def initialize()
		@name
		@wins
		@games
		@percentage
		@game
		end
		
end

#class the represents the ai that plays minesweeper/analyses the board
class Ai
end

#class the stores all references to rubygame library
class Ui
end

#function that tests making a baord, making a mask baord, then clicking on tile (5,5)
def mineTest()
	lol = Board.new(10,10,10)
	print lol.x, " xsize \n"
	print lol.y, " ysize \n"
	print lol.m, " mines \n"
	lol.pprintboard(lol.board)
	lol.reveal(5,5)
	lol.pprintboard(lol.mask)
	end
	
mineTest()