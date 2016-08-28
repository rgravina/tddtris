struct STetromino: Tetromino {
    var position = (column: 0, row: 0)
    var blocks = Array<(column: Int, row: Int)>()
    var height = 2
}