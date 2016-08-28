struct SquareTetromino: Tetromino {
    var position: (column: Int, row: Int)
    var height = 2
   var blocks: Array<(column: Int, row: Int)>
}