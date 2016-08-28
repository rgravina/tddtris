struct SettleTetrominoAction: Action {
    func perform(state: GameState) -> GameState {
        var nextState = state
        nextState.tetromino = nil
        return nextState
    }
}