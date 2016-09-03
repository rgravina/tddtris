class DefaultInputHandler: InputHandler {
    let view: GameView!
    let gameState: GameState!

    init(view: GameView, gameState: GameState) {
        self.view = view
        self.gameState = gameState
    }
    func didSwipeLeft() {
        let action = MoveTetrominoLeftOneColumnAction(
            view: view,
            state: gameState
        )
        action.perform()
    }

    func didSwipeRight() {
        let action = MoveTetrominoRightOneColumnAction(
            view: view,
            state: gameState
        )
        action.perform()
    }
}