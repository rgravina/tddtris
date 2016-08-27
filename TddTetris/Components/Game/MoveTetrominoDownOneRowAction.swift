struct MoveTetrominoDownOneRowAction: Action {
    let view: GameView

    init(view: GameView) {
        self.view = view
    }

    func perform(state: GameState) -> GameState {
        view.moveDownOneRow(state.tetromino!)
        return state
    }
}