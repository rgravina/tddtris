struct STetromino: Tetromino {
    var position = (column: 0, row: 0)
    var blocks = Array<(column: Int, row: Int)>()
    var lowerFacingBlocks: Array<(column: Int, row: Int)> {
        get {
            return [blocks[0], blocks[2], blocks[3]]
        }
    }
    var leftFacingBlocks: Array<(column: Int, row: Int)> {
        get {
            return [blocks[0], blocks[1]]
        }
    }
    var rightFacingBlocks: Array<(column: Int, row: Int)> {
        get {
            return [blocks[2], blocks[3]]
        }
    }
}