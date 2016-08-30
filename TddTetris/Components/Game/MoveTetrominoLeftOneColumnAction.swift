struct MoveTetrominoLeftOneColumnAction: Action {
    let view: GameView

    init(view: GameView) {
        self.view = view
    }

    func perform(state: GameState) -> GameState {
        let tetromino = state.tetromino!
        if tetromino.position.column == 0 {
            return state
        }
        let movedTemtromino = STetromino(
            position: (
                tetromino.position.column - 1,
                tetromino.position.row
            ),
            blocks: [
                (tetromino.blocks[0].column - 1,
                    tetromino.blocks[0].row),
                (tetromino.blocks[1].column - 1,
                    tetromino.blocks[1].row),
                (tetromino.blocks[2].column - 1,
                    tetromino.blocks[2].row),
                (tetromino.blocks[3].column - 1,
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
        view.moveLeftOneColumn()
        return state
    }
}