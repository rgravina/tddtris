class DropTetrominoAction: Action {
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
        while !collisionDetector.wouldCollide(.DOWN) {
            let tetromino = state.tetromino!
            let movedTemtromino = tetromino.move(.DOWN) as! STetromino
            state.tetromino = movedTemtromino
            for position in tetromino.blocks {
                state.cells[position.column][position.row] = false
            }
            for position in movedTemtromino.blocks {
                state.cells[position.column][position.row] = true
            }
            view.moveDownOneRow()
        }
    }
}