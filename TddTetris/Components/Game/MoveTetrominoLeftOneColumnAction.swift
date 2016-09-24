class MoveTetrominoLeftOneColumnAction: Action {
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
        if (collisionDetector.wouldCollide(.left)) {
            return
        }
        let movedTetromino = tetromino.move(.left)
        state.tetromino = movedTetromino
        for position in tetromino.blocks {
            state.free(
                position: Position(
                    column: tetromino.position.column + position.column,
                    row: tetromino.position.row + position.row
            ))
       }
        for position in movedTetromino.blocks {
            state.occupy(
                position: Position(
                    column: movedTetromino.position.column + position.column,
                    row: movedTetromino.position.row + position.row
            ))
        }
        view.move(movedTetromino)
    }
}
