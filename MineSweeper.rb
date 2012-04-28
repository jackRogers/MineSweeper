#MineSweeper
#classes v0.1
#By Jack Rogers

#class representing a tile on the game board
#not yet merged with Board class
class Tile
	
	attr_accessor :x, :y, :value
	
	def initialize(x,y,value,board)
		@x = x
		@y = y
		@value = value
		@board = board
		
		@neighbors = getNeighbors()
		
	#returns a list of neighbors for a given tile
	#under construction
	def getNeighbors()
		row = @x
		column = @y
		board = @board
		columns = board.columns
		rows = board.rows
		neighbors = []
		
		#Check up
			if row == 0
				print "" #no tile above
			else
				neighbors.push(board[row-1][column])
				end
			
		#Check down
			if row == rows - 1
				print "" # no tile below
			else
				neighbors.push(board[row+1][column])
				end
				
		#Check left
			if column == 0
				print "" # no tile to the left
			else
				neighbors.push(board[row][column-1])
				end
				
		#Check right
			if column == columns - 1
				print "" # no tile to the right
			else
				neighbors.push(board[row][column+1])
				end
		
		#Check up-left
			if row == 0
				print "" # no tiles above
			elsif column == 0
				print "" # no tiles left
			else
				neighbors.push(board[row-1][column-1])
				end
		
		#Check up-right
			if column == columns - 1
				print "" #no tiles to the right
			elsif row == 0
				print "" # no tiles above
			else
				neighbors.push(board[row-1][column+1])
				end
		
		#Check down-left
			if column == 0
				print "" #no tile to the left
			elsif row == rows - 1
				print "" #no tile below
			else
				neighbors.push(board[row+1][column-1])
				end
		
		#Check down-right
			if column == columns - 1
				print "" #no tile right
			elsif row == rows - 1
				print "" #no tile left
			else
				neighbors.push(board[row+1][column+1])
				end

	end


end
end

#class representing the game board	
class Board

	#lets us access instance variables
	attr_accessor :x,:y,:m,:board,:mask, :alive

	#new instance function
	def initialize(columns,rows,mines)
		@columns = columns						#horizonal size
		@rows = rows							#vertical size
		@mines = mines						#number of mines
		@board = makeBoard()
		popBoard()
		@mask = makeMaskBoard()
		@alive = true
	end
		
	#makeBoard Function
	def makeBoard()
		board = Array.new(@rows)
		board.size.times {|lolcat| board[lolcat] = Array.new(@columns,0)}
		placed = 0
		while placed < @mines do
			column = rand(@columns)
			row = rand(@rows)
			if board[column][row] == 0
				board[column][row] = "*"
				placed += 1
				#pop board as we place mines?
			elsif board[column][row] == "*"
				#print "already a mine here"
			else 
				print "Something went wrong"
				break
			end 
		end
		return board
	end
	
	#function that checks neighbors of a given tile to set value of each tile propperly
	def checker(row,column)
	# This function is very redundant and can be written better by a few smaller sub functions to avoid repetetive code
	#Turns out
		#i = row
		#j = column
		#will change commenting appropriatly
		
		#UNDER CONSTRUCTION
		
		#Check up
			if @board[row][column] == "*"
				return nil
				end
		
			if row == 0
				print "" #no tile above
			elsif @board[row-1][column] == "*"
				@board[row][column] += 1
				end
			
		#Check down
			if row == @rows - 1
				print "" #no tile below
			elsif @board[row+1][column] == "*"
				@board[row][column] += 1
				end
				
		#Check left
			if column == 0
				print "" #no tile left
			elsif @board[row][column-1] == "*"
				@board[row][column] += 1
				end
				
		#Check right
			if column == @columns - 1
				print "" #no tile right
			elsif @board[row][column+1] == "*"
				@board[row][column] += 1
				end
		
		#Check up-left
			if row == 0
				print "" # no tile up
			elsif column == 0
				print "" # no tile left
			elsif @board[row-1][column-1] == "*"
				@board[row][column] += 1
				end
		
		#Check up-right
			if column == @columns - 1
				print "" #no tile right
			elsif row == 0
				print "" # no tile up
			elsif @board[row-1][column+1] == "*"
				@board[row][column] += 1
				end
		
		#Check down-left
			if column == 0
				print "" #no tile left
			elsif row == @rows - 1
				print "" # no tile below
			elsif board[row+1][column-1] == "*"
				board[row][column] += 1
				end
		
		#Check down-right
			if column == @columns - 1
				print ""
			elsif row == @rows - 1
				print ""
			elsif @board[row+1][column+1] == "*"
				@board[row][column] += 1
				end
	
	return board
	
	end
	
	#runs checker on each tile
	def popBoard()
		@rows.times { |i| @columns.times { |j| checker(i,j) }
		}
				
	end
	
	#makes the minesweeper board that the player sees
	def makeMaskBoard()
		board = Array.new(@rows)
		board.size.times {|lolcat| board[lolcat] = Array.new(@columns,nil)}
		return board
		end
		
	#reveals tiles on the mask board
	def reveal(row,column)
		if @mask[row][column] == nil
			print "new",row,column,"\n"
			#if mine
			if @board[row][column] == "*"
				@mask[row][column] = @board[row][column]
				print "YOU LOSE"
				@alive = false
			#if number
			elsif @board[row][column] != 0
				@mask[row][column] = @board[row][column]
			#if empty
			elsif @board[row][column] == 0
				@mask[row][column] = @board[row][column]
				#reveal every non-border tile around tile
				
				#reveal up
				if row == 0
				else
					#print i,j,"revealed",i,j-1,"\n"
					reveal(row-1,column)
					end
				
				#reveal down
				if row == @rows-1
					print ""
				else
					print ""
					reveal(row+1,column)
					end
				
				#reveal left
				if column == 0
					print ""
				else
					print ""
					reveal(row,column-1)
					end
				
				#reveal right
				if column == @columns-1
					print ""
				else
					print ""
					reveal(row,column+1)
					end
				#reveal upleft
		
				if row == 0
					print ""
				elsif column == 0
					print ""
				else
					print ""
					reveal(row-1,column-1)
					end
			#Check up-right
				if column == @columns - 1
					print ""
				elsif row == 0
					print ""
				else
					print ""
					reveal(row-1,column+1)
					end
			
			#Check down-left
				if column == 0
					print ""
				elsif row == @rows - 1
					print ""
				else
					print ""
					reveal(row+1,column-1)
					end
			#Check down-right
				if row == @rows - 1
					print ""
				elsif column == @columns - 1
					print ""
				else
					print ""
					reveal(row+1,column+1)
					
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
		@rows.times {|i| @columns.times {|j| if board[i][j] == 0
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
def playtest()
	lol = Board.new(10,10,10)
	lol.pprintboard(lol.board)
	lol.pprintboard(lol.mask)
	while lol.alive == true do
		print "What row?\n"
		row = gets.to_i()
		print "What column?\n"
		column = gets.to_i()
		lol.reveal(row,column)
		lol.pprintboard(lol.mask)
	end
	end
	

def mineTest()
	lol = Board.new(10,10,10)
	print lol.x, " xsize \n"
	print lol.y, " ysize \n"
	print lol.m, " mines \n"
	lol.pprintboard(lol.board)
	lol.reveal(0,5)
	print "0,5\n"
	lol.pprintboard(lol.mask)
	lol.reveal(5,0)
	print "5,0\n"
	lol.pprintboard(lol.mask)
	end


playtest()

