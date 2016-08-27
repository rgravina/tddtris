import UIKit

class DefaultTickHandler: TickHandler {
    private let timeKeeper: TimeKeeper
    private var actionSelector: ActionSelector!
    private let tetrominoGenerator: TetrominoGenerator
    private let view: GameView
    private var gameState = GameState()

    init (view: GameView,
          tetrominoGenerator: TetrominoGenerator,
          timeKeeper: TimeKeeper,
          actionSelector: ActionSelector
    ) {
        self.view = view
        self.tetrominoGenerator = tetrominoGenerator
        self.timeKeeper = timeKeeper
        self.actionSelector = actionSelector
    }

    func update(currentTime: NSTimeInterval) {
        if (timeKeeper.update(currentTime)) {
            tick()
        }
    }

    func tick() {
        let nextAction = actionSelector.next(gameState)
        gameState = nextAction.perform(
            gameState,
            tetrominoGenerator: tetrominoGenerator,
            view: view
        )
    }
}