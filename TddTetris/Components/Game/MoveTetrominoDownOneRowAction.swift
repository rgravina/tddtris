struct MoveTetrominoDownOneRowAction: Action {
    let view: GameView

    init(view: GameView) {
        self.view = view
    }

    func perform(state: GameState) -> GameState {
        let tetromino = state.tetromino!
        var nextState = state
        let movedTemtromino = STetromino(
            position: (
                tetromino.position.column,
                tetromino.position.row + 1
            ),
            height: 2,
            blocks: [
                (tetromino.blocks[0].column, tetromino.blocks[0].row + 1),
                (tetromino.blocks[1].column, tetromino.blocks[1].row + 1),
                (tetromino.blocks[2].column, tetromino.blocks[2].row + 1),
                (tetromino.blocks[3].column, tetromino.blocks[3].row + 1)
            ]
        )
        nextState.tetromino = movedTemtromino
        for position in tetromino.blocks {
            nextState.cells[position.column][position.row] = false
        }
        for position in movedTemtromino.blocks {
            nextState.cells[position.column][position.row] = true
        }
        view.moveDownOneRow()
        return nextState
    }
}