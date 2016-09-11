class DefaultInputHandler: InputHandler {
    let view: GameView
    let gameState: GameState
    let collisionDetector: CollisionDetector

    init(
        view: GameView,
        gameState: GameState,
        collisionDetector: CollisionDetector
    ) {
        self.view = view
        self.gameState = gameState
        self.collisionDetector = collisionDetector
    }

    func didSwipeLeft() {
        let action = MoveTetrominoLeftOneColumnAction(
            view: view,
            state: gameState,
            collisionDetector: collisionDetector
        )
        action.perform()
    }

    func didSwipeRight() {
        let action = MoveTetrominoRightOneColumnAction(
            view: view,
            state: gameState,
            collisionDetector: collisionDetector
        )
        action.perform()
    }

    func didSwipeDown() {
        let action = DropTetrominoAction(
            view: view,
            state: gameState,
            collisionDetector: collisionDetector
        )
        action.perform()
    }

    func didTap() {
        let action = RotateTetrominoAction(
            view: view,
            state: gameState,
            collisionDetector: collisionDetector
        )
        action.perform()
    }
}