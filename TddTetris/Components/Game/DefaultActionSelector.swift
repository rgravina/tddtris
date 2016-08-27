struct DefaultActionSelector: ActionSelector {
    func next() -> Action {
        return NextTetrominoAction()
    }
}