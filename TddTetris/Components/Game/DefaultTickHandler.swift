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
        let nextAction = actionSelector.next(gameState)
        gameState = nextAction.perform(gameState)
    }
}