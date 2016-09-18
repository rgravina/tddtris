class RotateTetrominoAction : Action {
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
        if (!collisionDetector.canRotate()) {
            return
        }
        let tetromino = state.tetromino!
        let rotatedTetromino = tetromino.rotate()
        state.tetromino = rotatedTetromino
        for position in tetromino.blocks {
            state.cells[position.column][position.row] = false
        }
        for position in rotatedTetromino.blocks {
            state.cells[position.column][position.row] = true
        }
        view.move(rotatedTetromino)
    }
}
