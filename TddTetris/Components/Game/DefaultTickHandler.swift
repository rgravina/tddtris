import UIKit

class DefaultTickHandler: TickHandler {
    private let view: GameView
    private let tetrominoGenerator: TetrominoGenerator
    private let timeKeeper: TimeKeeper
    private var tetromino: Tetromino!
    private var actionSelector: ActionSelector!

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
        let nextAction = actionSelector.next()
        nextAction.perform()

        if (tetromino == nil) {
            tetromino = tetrominoGenerator.next()
            view.displayNext(tetromino)
            return
        }
        view.moveDownOneRow(tetromino)
    }
}