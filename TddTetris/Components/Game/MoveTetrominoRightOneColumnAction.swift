class MoveTetrominoRightOneColumnAction: Action {
    let view: GameView
    let state: GameState
    let collisionDetector: CollisionDetector

    init(
        view: GameView,
        state: GameState,
        collisionDetector: CollisionDetector
        ) {
        self.view = view
        self.state = state
        self.collisionDetector = collisionDetector
    }

    func perform() {
        if (state.tetromino == nil) {
            return
        }
        let tetromino = state.tetromino!
        if (collisionDetector.wouldCollide(.RIGHT)) {
            return
        }
        let movedTemtromino = STetromino(
            position: (
                tetromino.position.column + 1,
                tetromino.position.row
            ),
            blocks: [
                (tetromino.blocks[0].column + 1,
                    tetromino.blocks[0].row),
                (tetromino.blocks[1].column + 1,
                    tetromino.blocks[1].row),
                (tetromino.blocks[2].column + 1,
                    tetromino.blocks[2].row),
                (tetromino.blocks[3].column + 1,
                    tetromino.blocks[3].row)
            ]
        )
        state.tetromino = movedTemtromino
        for position in tetromino.blocks {
            state.cells[position.column][position.row] = false
        }
        for position in movedTemtromino.blocks {
            state.cells[position.column][position.row] = true
        }
        view.moveRightOneColumn()
    }
}