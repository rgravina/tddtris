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
            return tetromino.lowerFacingBlocks.contains(where: {position in
                return state.occupied(
                    position: Position(
                        column: tetromino.position.column + position.column,
                        row: tetromino.position.row + position.row + 1
                ))}
            )
        case .left:
            return tetromino.leftFacingBlocks.contains(where: {position in
                return state.occupied(
                    position: Position(
                        column: tetromino.position.column + position.column - 1,
                        row: tetromino.position.row + position.row
                ))}
            )
        case .right:
            return tetromino.rightFacingBlocks.contains(where: {position in
                return state.occupied(
                    position: Position(
                        column: tetromino.position.column + position.column + 1,
                        row: tetromino.position.row + position.row
                ))}
            )
        default:
            return false
        }
    }

    func canRotate() -> Bool {
        return false
    }
}
