import UIKit

class DefaultTickHandler: TickHandler {
    private let timeKeeper: TimeKeeper
    private var actionSelector: ActionSelector!
    private var gameState = GameState()

    init (timeKeeper: TimeKeeper,
          actionSelector: ActionSelector
    ) {
        self.timeKeeper = timeKeeper
        self.actionSelector = actionSelector
    }

    func update(currentTime: NSTimeInterval) {
        if (timeKeeper.update(currentTime)) {
            tick()
        }
    }

    func tick() {
        gameState = actionSelector
            .next(gameState)
            .perform(gameState)
    }
}