class NextTetrominoAction: Action {
    let view: GameView
    let tetrominoGenerator: TetrominoGenerator

    init(view: GameView, tetrominoGenerator: TetrominoGenerator) {
        self.view = view
        self.tetrominoGenerator = tetrominoGenerator
    }

    func perform(state: GameState) -> GameState {
        let tetromino = tetrominoGenerator.next()
        state.tetromino = tetromino
        for position in tetromino.blocks {
            state.cells[position.column][position.row] = true
        }
        view.displayNext(tetromino)
        return state
    }
}