struct DefaultActionSelector: ActionSelector {
    func next(state: GameState) -> Action {
        if state.tetromino == nil {
            return NextTetrominoAction()
        }
        return MoveTetrominoDownOneRowAction()
    }
}