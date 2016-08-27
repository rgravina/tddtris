struct DefaultActionSelector: ActionSelector {
    let view: GameView
    let tetrominoGenerator: TetrominoGenerator

    init(view: GameView,
         tetrominoGenerator: TetrominoGenerator) {
        self.view = view
        self.tetrominoGenerator = tetrominoGenerator
    }

    func next(state: GameState) -> Action {
        if state.tetromino == nil {
            return NextTetrominoAction(view: view,  tetrominoGenerator: tetrominoGenerator)
        }
        return MoveTetrominoDownOneRowAction(view: view)
    }
}