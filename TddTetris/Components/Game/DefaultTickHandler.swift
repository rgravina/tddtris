import UIKit

class DefaultTickHandler: TickHandler {
    fileprivate let timeKeeper: TimeKeeper
    fileprivate var actionSelector: ActionSelector!
    fileprivate var gameState: GameState!

    init (
        timeKeeper: TimeKeeper,
        actionSelector: ActionSelector,
        gameState: GameState
    ) {
        self.timeKeeper = timeKeeper
        self.actionSelector = actionSelector
        self.gameState = gameState
    }

    func update(_ currentTime: TimeInterval) {
        if (timeKeeper.update(currentTime)) {
            tick()
        }
    }

    func tick() {
        actionSelector.next().perform()
    }
}
