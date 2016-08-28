struct NextTetrominoAction: Action {
    let view: GameView
    let tetrominoGenerator: TetrominoGenerator

    init(view: GameView, tetrominoGenerator: TetrominoGenerator) {
        self.view = view
        self.tetrominoGenerator = tetrominoGenerator
    }

    func perform(state: GameState) -> GameState {
        var nextState = state
        let tetromino = tetrominoGenerator.next()
        nextState.tetromino = tetromino
        for position in tetromino.blocks {
            nextState.cells[position.column][position.row] = true
        }
        view.displayNext(tetromino)
        return nextState
    }
}