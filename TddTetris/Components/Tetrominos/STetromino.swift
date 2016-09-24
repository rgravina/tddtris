struct STetromino: Tetromino {
    var position = (column: 0, row: 0)
    private var _blocks = Array<(column: Int, row: Int)>()
    var blocks: Array<(column: Int, row: Int)> {
        return _blocks.map({block in
            return (
                column: position.column + block.column,
                row: position.row + block.row
            )
        })
    }
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
        _blocks = [
            (column: 0, row: 1),
            (column: 1, row: 1),
            (column: 1, row: 0),
            (column: 2, row: 0),
        ]
    }

    init(position: (column: Int, row: Int), blocks: Array<(column: Int, row: Int)>) {
        self.position = position
        self._blocks = blocks
    }

    func move(_ direction: Direction) -> Tetromino {
        switch (direction) {
        case .down:
        return STetromino(
            position: (
                position.column,
                position.row + 1
            ),
            blocks: _blocks
        )
        case .left:
            return STetromino(
                position: (
                    position.column - 1,
                    position.row
                ),
                blocks: _blocks
            )
        case .right:
            return STetromino(
                position: (
                    position.column + 1,
                    position.row
                ),
                blocks: _blocks
            )
        default:
            return self
        }
    }

    func rotate() -> Tetromino {
        return self
    }
}
