class MoveTetrominoRightOneColumnAction: Action {
    let view: GameView
    let state: GameState
    let collisionDetector: CollisionDetector

    init(
        view: GameView,
        state: GameState,
        collisionDetector: CollisionDetector
    ) {
        self.view = view
        self.state = state
        self.collisionDetector = collisionDetector
    }

    func perform() {
        if (state.tetromino == nil) {
            return
        }
        let tetromino = state.tetromino!
        if (collisionDetector.wouldCollide(.right)) {
            return
        }
        let movedTetromino = tetromino.move(.right)
        state.tetromino = movedTetromino

        for position in tetromino.blocks {
            state.cells[tetromino.position.column + position.column][tetromino.position.row + position.row] = false
        }
        for position in movedTetromino.blocks {
            state.cells[movedTetromino.position.column + position.column][movedTetromino.position.row + position.row] = true
        }
        view.move(movedTetromino)
    }
}
