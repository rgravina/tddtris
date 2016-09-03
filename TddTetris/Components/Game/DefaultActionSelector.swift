class DefaultActionSelector: ActionSelector {
    let view: GameView
    let tetrominoGenerator: TetrominoGenerator
    let collisionDetector: CollisionDetector

    init(view: GameView,
         tetrominoGenerator: TetrominoGenerator,
         collisionDetector: CollisionDetector
    ) {
        self.view = view
        self.tetrominoGenerator = tetrominoGenerator
        self.collisionDetector = collisionDetector
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

        for position in tetromino.lowerBlocks {
            if collisionDetector.wouldCollide(
                state,
                position: position,
                direction: .DOWN
            ) {
                return SettleTetrominoAction()
            }
        }

        return MoveTetrominoDownOneRowAction(view: view)
    }
}