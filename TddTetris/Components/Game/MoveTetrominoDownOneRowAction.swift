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
        let movedTetromino = tetromino.move(.DOWN) as! STetromino
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
