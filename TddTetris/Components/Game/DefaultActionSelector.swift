struct DefaultActionSelector: ActionSelector {
    let view: GameView
    let tetrominoGenerator: TetrominoGenerator

    init(view: GameView,
         tetrominoGenerator: TetrominoGenerator) {
        self.view = view
        self.tetrominoGenerator = tetrominoGenerator
    }

    func next(state: GameState) -> Action {
        let maybeTetromino = state.tetromino

        if maybeTetromino == nil {
            return NextTetrominoAction(
                view: view,
                tetrominoGenerator: tetrominoGenerator
            )
        }

        let tetromino = maybeTetromino!

        if (tetromino.position.row == GameState.ROWS - tetromino.height) {
            return SettleTetrominoAction()
        }

        return MoveTetrominoDownOneRowAction(view: view)
    }
}