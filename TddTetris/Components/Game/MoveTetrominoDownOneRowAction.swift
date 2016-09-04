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
        let movedTemtromino = tetromino.move(.DOWN) as! STetromino
        state.tetromino = movedTemtromino
        for position in tetromino.blocks {
            state.cells[position.column][position.row] = false
        }
        for position in movedTemtromino.blocks {
            state.cells[position.column][position.row] = true
        }
        view.moveDownOneRow()
    }
}