class SettleTetrominoAction: Action {
    func perform(state: GameState) -> GameState {
        state.tetromino = nil
        return state
    }
}