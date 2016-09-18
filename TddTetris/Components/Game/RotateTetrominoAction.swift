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
        if (collisionDetector.canRotate()) {
            let rotatedTetromino = state.tetromino!.rotate()
            state.tetromino = rotatedTetromino
            view.move(rotatedTetromino)
        }
    }
}
