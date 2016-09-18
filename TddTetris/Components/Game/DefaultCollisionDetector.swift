class DefaultCollisionDetector: CollisionDetector {
    let state: GameState

    init(state: GameState) {
        self.state = state
    }

    func wouldCollide(direction: Direction) -> Bool {
        let maybeTetromino = state.tetromino
        if maybeTetromino == nil {
            return false
        }
        let tetromino = maybeTetromino!

        switch (direction) {
        case .DOWN:
            for position in tetromino.lowerFacingBlocks {
                if (position.row == GameState.ROWS - 1) {
                    return true
                }
                if (state.cells[position.column][position.row + 1]) {
                    return true
                }
            }
        case .LEFT:
            for position in tetromino.leftFacingBlocks {
                if (position.column == 0) {
                    return true
                }
                if (state.cells[position.column - 1][position.row]) {
                    return true
                }
            }
        case .RIGHT:
            for position in tetromino.rightFacingBlocks {
                if (position.column == GameState.COLUMNS - 1) {
                    return true
                }
                if (state.cells[position.column + 1][position.row]) {
                    return true
                }
            }
        default:
            return false
        }
        return false
    }

    func canRotate() -> Bool {
        return true
    }
}
