struct STetromino: Tetromino {
    var position = (column: 0, row: 0)
    var blocks = Array<(column: Int, row: Int)>()
    var lowerBlocks: Array<(column: Int, row: Int)> {
        get {
            return [blocks[0], blocks[2]]
        }
    }
}