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

    func move(direction: CollisionDetectorDirection) -> Tetromino {
        switch (direction) {
        case .DOWN:
        return STetromino(
            position: (
                position.column,
                position.row + 1
            ),
            blocks: [
                (blocks[0].column, blocks[0].row + 1),
                (blocks[1].column, blocks[1].row + 1),
                (blocks[2].column, blocks[2].row + 1),
                (blocks[3].column, blocks[3].row + 1)
            ]
        )
        case .LEFT:
            return STetromino(
                position: (
                    position.column - 1,
                    position.row
                ),
                blocks: [
                    (blocks[0].column - 1, blocks[0].row),
                    (blocks[1].column - 1, blocks[1].row),
                    (blocks[2].column - 1, blocks[2].row),
                    (blocks[3].column - 1, blocks[3].row)
                ]
            )
        case .RIGHT:
            return STetromino(
                position: (
                    position.column + 1,
                    position.row
                ),
                blocks: [
                    (blocks[0].column + 1, blocks[0].row),
                    (blocks[1].column + 1, blocks[1].row),
                    (blocks[2].column + 1, blocks[2].row),
                    (blocks[3].column + 1, blocks[3].row)
                ]
            )
        default:
            return self
        }
    }
}