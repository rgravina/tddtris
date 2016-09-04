class DefaultActionSelector: ActionSelector {
    let view: GameView
    let state: GameState
    let tetrominoGenerator: TetrominoGenerator
    let collisionDetector: CollisionDetector

    init(view: GameView,
         state: GameState,
         tetrominoGenerator: TetrominoGenerator,
         collisionDetector: CollisionDetector
    ) {
        self.view = view
        self.state = state
        self.tetrominoGenerator = tetrominoGenerator
        self.collisionDetector = collisionDetector
    }

    func next() -> Action {
        let maybeTetromino = state.tetromino
        if maybeTetromino == nil {
            return NextTetrominoAction(
                view: view,
                state: state,
                tetrominoGenerator: tetrominoGenerator
            )
        }

        if collisionDetector.wouldCollide(.DOWN) {
            return SettleTetrominoAction(
                state: state
            )
        }

        return MoveTetrominoDownOneRowAction(
            view: view,
            state: state
        )
    }
}