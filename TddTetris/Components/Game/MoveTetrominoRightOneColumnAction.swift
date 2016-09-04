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
        if (collisionDetector.wouldCollide(.RIGHT)) {
            return
        }
        let movedTetromino = tetromino.move(.RIGHT)
        state.tetromino = movedTetromino
        for position in tetromino.blocks {
            state.cells[position.column][position.row] = false
        }
        for position in movedTetromino.blocks {
            state.cells[position.column][position.row] = true
        }
        view.moveRightOneColumn()
    }
}