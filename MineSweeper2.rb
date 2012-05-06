#MineSweeper2
#Version 0.2
#By Jack Rogers

#ToDo
	#Tile
		#function that returns value
	#Board
		#function that returns a tile
		#consider making mask a class of its own

class Tile
	attr_accessor :row, :column, :value, :neighbors, :board
	def initialize(row,column,value)
		@row = row
		@column = column
		@value = value
		@neighbors = []
	end
		
	def addNeighbor(neighbor)
		@neighbors.push(neighbor)
	end
	
	def increaseNeighbors()
		@neighbors.each{|neighbor| 
			if neighbor.value != 'M'
				neighbor.value += 1 
			end
		}
	end
	
end

class Board
	attr_accessor :x,:y,:m,:board, :mask
	def initialize(columns,rows,mines)
		@columns = columns					
		@rows = rows						
		@mines = mines						
		@board = makeBoard()
		makeNeighbors()
		placeMines()
		@mask = makeMask()
		@alive = true
		end
	
	def makeBoard()
		board = Array.new(@rows)
		@rows.times{|row| board[row] = Array.new(@columns)}
		@rows.times{|row| @columns.times {|column| board[row][column] = Tile.new(row,column,0)}}
		return board
	end
		
	def everyTile()
		tiles = []
		@rows.times{|row| @columns.times {|column| tiles.push(@board[row][column])}}
		return tiles
	end
		
	def makeNeighbors()
		tiles = everyTile()
		tiles.each{|tile|
			# if in top row
			if tile.row == 0
				#add neighbor below
				tile.addNeighbor(@board[tile.row+1][tile.column])
				#if in topleft corner
				if tile.column == 0
					#add neighbor right
					tile.addNeighbor(@board[tile.row][tile.column+1])
					#add neighbor down right
					tile.addNeighbor(@board[tile.row+1][tile.column+1])
				#if in topright corner
				elsif tile.column == @columns-1
					#add neighbor left
					tile.addNeighbor(@board[tile.row][tile.column-1])
					#add neighbor down left
					tile.addNeighbor(@board[tile.row+1][tile.column-1])
				#if in tpo row but not a corner
				else
					#add neighbor left
					tile.addNeighbor(@board[tile.row][tile.column-1])
					#add neighbor right
					tile.addNeighbor(@board[tile.row][tile.column+1])
					#add neighbor down left
					tile.addNeighbor(@board[tile.row+1][tile.column-1])
					#add neighbor down right
					tile.addNeighbor(@board[tile.row+1][tile.column+1])
				end
			#if on bottom row
			elsif tile.row == @rows -1
				#add neighbor above
				tile.addNeighbor(@board[tile.row-1][tile.column])
				#if in bottom left corner
				if tile.column == 0
					#add neighbor right
					tile.addNeighbor(@board[tile.row][tile.column+1])
					#add neighbor up right
					tile.addNeighbor(@board[tile.row-1][tile.column+1])
				#if in bottom right corner
				elsif tile.column == @columns -1
					#add neighbor left
					tile.addNeighbor(@board[tile.row][tile.column-1])
					#add neighbor up left
					tile.addNeighbor(@board[tile.row-1][tile.column-1])
				#if in bottom row but not a corner
				else
					#add neighbor left
					tile.addNeighbor(@board[tile.row][tile.column-1])
					#add neighbor right
					tile.addNeighbor(@board[tile.row][tile.column+1])
					#add neighbor up left
					tile.addNeighbor(@board[tile.row-1][tile.column-1])
					#add neighbor up right
					tile.addNeighbor(@board[tile.row-1][tile.column+1])
				end
			#if not on top or bottom row
			else
				#add neighbor up
				tile.addNeighbor(@board[tile.row-1][tile.column])
				#add neighbor down
				tile.addNeighbor(@board[tile.row+1][tile.column])
				#if in leftmost column
				if tile.column == 0
					#add neighbor right
					tile.addNeighbor(@board[tile.row][tile.column+1])
					#add neighbor upright
					tile.addNeighbor(@board[tile.row-1][tile.column+1])
					#add neighbor downright
					tile.addNeighbor(@board[tile.row+1][tile.column+1])
				#if in rightmost column
				elsif tile.column == @columns-1
					#add neighbor left
					tile.addNeighbor(@board[tile.row][tile.column-1])
					#add neighbor upleft
					tile.addNeighbor(@board[tile.row-1][tile.column-1])
					#add neighbor downleft
					tile.addNeighbor(@board[tile.row+1][tile.column-1])
				#if not on either edge
				else
					#add neighbor left
					tile.addNeighbor(@board[tile.row][tile.column-1])
					#add neighbor right
					tile.addNeighbor(@board[tile.row][tile.column+1])
					#add neighbor upleft
					tile.addNeighbor(@board[tile.row-1][tile.column-1])
					#add neighbor upright
					tile.addNeighbor(@board[tile.row-1][tile.column+1])
					#add neighbor down left
					tile.addNeighbor(@board[tile.row+1][tile.column-1])
					#add neighbor down right
					tile.addNeighbor(@board[tile.row+1][tile.column+1])
				end
				
			end
		}
	end
			
	def placeMines()
		placed = 0
		while placed < @mines do
			column = rand(@columns)
			row = rand(@rows)
			if @board[row][column].value != 'M'
				@board[row][column].value = 'M'
				@board[row][column].increaseNeighbors()
				placed += 1
			end
		end
	end
	
	def makeMask()
		mask = Array.new(@rows)
		@rows.times{|row| mask[row] = Array.new(@columns)}
		return mask
	end
	
	def reveal(row,column)
		#has this tile been revealed
		if @mask[row][column] == nil
			#check if tile is mine
			if @board[row][column].value == "M"
				@mask[row][column] = "M"
				print "YOU LOSE"
				@alive = false
			#check if tile has mine neighbor
			elsif @board[row][column].value != 0
				@mask[row][column] = @board[row][column].value
				
			elsif @board[row][column].value == 0
				#mark tile as revealed
				@mask[row][column] = " "
				#get neighbors of tile
				toReveal = @board[row][column].neighbors
				toReveal.each{|tile|
					r = tile.row
					c = tile.column
					reveal(r,c)
				}
			end
		
		else
			#this tile has already been revealed or flagged
		end
			
	end
	
	def flag(row,column)
		@mask[row][column] = "F"
	
	end
	
	def pprintBoard()
		print "\n"
		@rows.times{|row| 
			@columns.times {|column|
			print "\t", @board[row][column].value
			}
			print "\n"
		}
	end
	def pprintMask()
		print "\n"
		@rows.times{|row| 
			@columns.times {|column|
			print "\t", @mask[row][column]
			}
			print "\n"
		}	
	
	end
end

def test()
	board = Board.new(10,10,10)
	board.pprintBoard()
	print "\n"
	board.reveal(5,5)
	board.pprintMask()
	print "\n"
end


test()
