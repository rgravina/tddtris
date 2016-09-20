class DefaultCollisionDetector: CollisionDetector {
    let state: GameState

    init(state: GameState) {
        self.state = state
    }

    func wouldCollide(_ direction: Direction) -> Bool {
        let maybeTetromino = state.tetromino
        if maybeTetromino == nil {
            return false
        }
        let tetromino = maybeTetromino!

        switch (direction) {
        case .down:
            for position in tetromino.lowerFacingBlocks {
                if (tetromino.position.row + position.row == GameState.ROWS - 1) {
                    return true
                }
                if (state.cells[tetromino.position.column + position.column][tetromino.position.row + position.row + 1]) {
                    return true
                }
            }
        case .left:
            for position in tetromino.leftFacingBlocks {
                if (tetromino.position.column + position.column == 0) {
                    return true
                }
                if (state.cells[tetromino.position.column - 1][tetromino.position.row + position.row]) {
                    return true
                }
            }
        case .right:
            for position in tetromino.rightFacingBlocks {
                if (tetromino.position.column + position.column == GameState.COLUMNS - 1) {
                    return true
                }
                if (state.cells[tetromino.position.column + position.column + 1][tetromino.position.row + position.row]) {
                    return true
                }
            }
        default:
            return false
        }
        return false
    }

    func canRotate() -> Bool {
        return false
    }
}
