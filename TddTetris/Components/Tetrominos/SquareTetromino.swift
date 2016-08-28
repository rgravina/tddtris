struct SquareTetromino: Tetromino {
    var position: (column: Int, row: Int)
    var blocks: Array<(column: Int, row: Int)>
    var lowerBlocks: Array<(column: Int, row: Int)> {
        get {
            return [blocks[1], blocks[3]]
        }
    }
}