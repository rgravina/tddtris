struct STetromino: Tetromino {
    var position = (column: 0, row: 0)
    var blocks = Array<(column: Int, row: Int)>()
    var lowerFacingBlocks: Array<(column: Int, row: Int)> {
        get {
            return [blocks[0], blocks[1], blocks[3]]
        }
    }
    var leftFacingBlocks: Array<(column: Int, row: Int)> {
        get {
            return [blocks[0], blocks[2]]
        }
    }
    var rightFacingBlocks: Array<(column: Int, row: Int)> {
        get {
            return [blocks[1], blocks[3]]
        }
    }

    init() {
        position = (3, 0)
        blocks = [
            (column: 0, row: 1),
            (column: 1, row: 1),
            (column: 1, row: 0),
            (column: 2, row: 0),
        ]
    }

    init(position: (column: Int, row: Int), blocks: Array<(column: Int, row: Int)>) {
        self.position = position
        self.blocks = blocks
    }

    func move(direction: Direction) -> Tetromino {
        switch (direction) {
        case .DOWN:
        return STetromino(
            position: (
                position.column,
                position.row + 1
            ),
            blocks: blocks
        )
        case .LEFT:
            return STetromino(
                position: (
                    position.column - 1,
                    position.row
                ),
                blocks: blocks
            )
        case .RIGHT:
            return STetromino(
                position: (
                    position.column + 1,
                    position.row
                ),
                blocks: blocks
            )
        default:
            return self
        }
    }

    func rotate() -> Tetromino {
        return self
    }
}
