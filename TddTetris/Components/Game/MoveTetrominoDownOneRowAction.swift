struct MoveTetrominoDownOneRowAction: Action {
    let view: GameView

    init(view: GameView) {
        self.view = view
    }

    func perform(state: GameState) -> GameState {
        let tetromino = state.tetromino!
        var nextState = state
        nextState.tetromino = STetromino(
            position: (
                tetromino.position.column,
                tetromino.position.row + 1
            )
        )
        view.moveDownOneRow()
        return nextState
    }
}