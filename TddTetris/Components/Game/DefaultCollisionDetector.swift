class DefaultCollisionDetector: CollisionDetector {
    let state: GameState

    init(state: GameState) {
        self.state = state
    }

    func wouldCollide(direction: CollisionDetectorDirection) -> Bool {
        let maybeTetromino = state.tetromino
        if maybeTetromino == nil {
            return false
        }
        let tetromino = maybeTetromino!

        switch (direction) {
        case .DOWN:
            for position in tetromino.lowerBlocks {
                if (position.row >= GameState.ROWS - 1) {
                    return true
                }
                if (state.cells[position.column][position.row + 1]) {
                    return true
                }
            }
        default:
            return false
        }
        return false
    }
}