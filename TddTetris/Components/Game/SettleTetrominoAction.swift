class SettleTetrominoAction: Action {
    func perform(state: GameState) {
        state.tetromino = nil
    }
}