import UIKit

class DefaultTickHandler: TickHandler {
    private let timeKeeper: TimeKeeper
    private var actionSelector: ActionSelector!
    private var gameState: GameState!

    init (timeKeeper: TimeKeeper,
          actionSelector: ActionSelector,
          gameState: GameState
    ) {
        self.timeKeeper = timeKeeper
        self.actionSelector = actionSelector
        self.gameState = gameState
    }

    func update(currentTime: NSTimeInterval) {
        if (timeKeeper.update(currentTime)) {
            tick()
        }
    }

    func tick() {
        actionSelector
            .next(gameState)
            .perform(gameState)
    }
}