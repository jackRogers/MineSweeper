#MineSweeper
#By Jack Rogers

#Current Functions
	#getInputs
	#makeBoard
	#checker
	#popBoard
	#main
	
#Still to do
	#player interaction
	#ai
	#first click mine
		#if first click is mine
			#remake board until that tile is not a mine
	#check solvability of board before a user plays
	#calculate probablities that a given tile is a mine
	#find optimal move
	#ui
	#


def getInputs()
	print 'How many cells in the x axis? '
	xcells = gets
	
	print 'How many cells in the y axis? '
	ycells = gets
	
	print 'How many mines would you like to place? '
	mines = gets
	
	return xcells, ycells, mines
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



def checker(board,i,j,xsize,ysize)
# This function is very redundant and can be written better by a few smaller sub functions to avoid repetetive code
		#Check up
			if board[i][j] == "*"
				return board
				end
		
			if j == 0
				print ""
			elsif board[i][j-1] == "*"
				board[i][j] += 1
				end
			
		#Check down
			if j == ysize - 1
				print ""
			elsif board[i][j+1] == "*"
				board[i][j] += 1
				end
				
		#Check left
			if i == 0
				print ""
			elsif board[i-1][j] == "*"
				board[i][j] += 1
				end
				
		#Check right
			if i == xsize - 1
				print ""
			elsif board[i+1][j] == "*"
				board[i][j] += 1
				end
		
		#Check up-left
			if i == 0
				print ""
			elsif j == 0
				print ""
			elsif board[i-1][j-1] == "*"
				board[i][j] += 1
				end
		
		#Check up-right
			if i == xsize - 1
				print ""
			elsif j == 0
				print ""
			elsif board[i+1][j-1] == "*"
				board[i][j] += 1
				end
		
		#Check down-left
			if i == 0
				print ""
			elsif j == ysize - 1
				print ""
			elsif board[i-1][j+1] == "*"
				board[i][j] += 1
				end
		
		#Check down-right
			if i == xsize - 1
				print ""
			elsif j == ysize - 1
				print ""
			elsif board[i+1][j+1] == "*"
				board[i][j] += 1
				end
	
	return board
	
end

def popBoard(board,xsize,ysize)
	intermediateBoard = board
	#For each i in range(xsize)
		#For each j in range(ysize)
			#intermediateBoard = checker(intermediateBoard,i,j,xsize,ysize)
	xsize.times { |i| ysize.times { |j| intermediateBoard = checker(intermediateBoard,i,j,xsize,ysize) }
	}
	return intermediateBoard
			
end

def pprintboard(x,y,board)
	print "\n\n\n"
	x.times {|i| y.times {|j| if board[i][j] == 0
								print " " 
							elsif board[i][j] == "*"
								print "* " 						
							else 
								print board[i][j]
								print " " 
								end}
								print "\n" } 
	print "\n\n\n"
	end
	
def main()
	# Get size of minesweeper board and number of mines
	x,y,m = getInputs()
	
	# Make sure all parameters are integers
	x = x.to_i
	y = y.to_i
	m = m.to_i
	
	# make an x by y board with m mines randomly placed
	board = makeBoard(x,y,m,0)
	
	
	# make each board element reflect the number of adjacent mines
	board = popBoard(board,x,y)
	
	#Look at board
	pprintboard(x,y,board)
	
	#make mask
	maskboard = makeBoard(x,y,0,nil)
	
	#getting ready to play
		#ideas
			#need api for clicking and marking
			#needs a second board to track what is revealed
			#need character to mark obscured tiles
			
			#player is given a mxn grid of obscured tiles
				#numbered grid on top and left side
			#player enters the coordinates the the tile and hits enter
				#screen updates with board after revealing the tile
					#need to prevent first move from being a mine
						#if first tile is a mine, make a new board and show it to the player after reavealing the tile.
	
	
	
end
	
main
