import UIKit

class DefaultTickHandler: TickHandler {
    private let view: GameView
    private let tetrominoGenerator: TetrominoGenerator
    private let timeKeeper: TimeKeeper
    private var tetromino: Tetromino!

    init (view: GameView,
          tetrominoGenerator: TetrominoGenerator,
          timeKeeper: TimeKeeper
    ) {
        self.view = view
        self.tetrominoGenerator = tetrominoGenerator
        self.timeKeeper = timeKeeper
    }

    func update(currentTime: NSTimeInterval) {
        if (timeKeeper.update(currentTime)) {
            tick()
        }
    }

    func tick() {
        if (tetromino == nil) {
            tetromino = tetrominoGenerator.next()
            view.displayNext(tetromino)
            return
        }
        view.moveDownOneRow(tetromino)
    }
}