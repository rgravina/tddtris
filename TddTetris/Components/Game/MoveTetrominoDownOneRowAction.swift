struct MoveTetrominoDownOneRowAction: Action {
    func perform(state: GameState, tetrominoGenerator: TetrominoGenerator, view: GameView) -> GameState {
        view.moveDownOneRow(state.tetromino!)
        return state
    }
}