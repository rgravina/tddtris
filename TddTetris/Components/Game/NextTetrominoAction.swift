struct NextTetrominoAction: Action {
    func perform(state: GameState, tetrominoGenerator: TetrominoGenerator, view: GameView) -> GameState {
        var newState = state
        newState.tetromino = tetrominoGenerator.next()
        view.displayNext(newState.tetromino!)
        return newState
    }
}