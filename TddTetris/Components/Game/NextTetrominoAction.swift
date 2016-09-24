class NextTetrominoAction: Action {
    let view: GameView
    let state: GameState
    let tetrominoGenerator: TetrominoGenerator

    init(
        view: GameView,
        state: GameState,
        tetrominoGenerator: TetrominoGenerator
    ) {
        self.view = view
        self.state = state
        self.tetrominoGenerator = tetrominoGenerator
    }

    func perform() {
        let tetromino = tetrominoGenerator.next()
        state.tetromino = tetromino
        for position in tetromino.blocks {
            state.occupy(
                position: Position(
                    column: tetromino.position.column + position.column,
                    row: tetromino.position.row + position.row
            ))
        }
        view.displayNext(tetromino)
    }
}
