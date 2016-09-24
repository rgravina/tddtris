class MoveTetrominoDownOneRowAction: Action {
    let view: GameView
    let state: GameState

    init(
        view: GameView,
        state: GameState
    ) {
        self.view = view
        self.state = state
    }

    func perform() {
        if (state.tetromino == nil) {
            return
        }
        let tetromino = state.tetromino!
        let movedTetromino = tetromino.move(.down) as! STetromino
        state.tetromino = movedTetromino
        for position in tetromino.blocks {
            state.free(
                position: Position(
                    column: position.column,
                    row: position.row
                )
            )
        }
        for position in movedTetromino.blocks {
            state.occupy(
                position: Position(
                    column: position.column,
                    row: position.row
                )
            )
        }
        view.move(movedTetromino)
    }
}
