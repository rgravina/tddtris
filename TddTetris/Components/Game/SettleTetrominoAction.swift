class SettleTetrominoAction: Action {
    let state: GameState

    init(state: GameState) {
        self.state = state
    }

    func perform() {
        state.tetromino = nil
    }
}