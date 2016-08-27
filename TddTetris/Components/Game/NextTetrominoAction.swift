struct NextTetrominoAction: Action {
    let view: GameView
    let tetrominoGenerator: TetrominoGenerator

    init(view: GameView, tetrominoGenerator: TetrominoGenerator) {
        self.view = view
        self.tetrominoGenerator = tetrominoGenerator
    }

    func perform(state: GameState) -> GameState {
        var newState = state
        newState.tetromino = tetrominoGenerator.next()
        view.displayNext(newState.tetromino!)
        return newState
    }
}