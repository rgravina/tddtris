import UIKit

class TetrisGame: Game {
    let viewer: GameView!
    let tetrominoGenerator: TetrominoGenerator!
    let timeKeeper: TimeKeeper!
    var tetromino: Tetromino!

    init(viewer: GameView,
         tetrominoGenerator: TetrominoGenerator,
         timeKeeper: TimeKeeper
        ) {
        self.viewer = viewer
        self.tetrominoGenerator = tetrominoGenerator
        self.timeKeeper = timeKeeper
    }

    func configure(frame: CGRect) {
        viewer.configure(self, frame: frame, timeKeeper: timeKeeper)
        viewer.presentScene()
        tetromino = tetrominoGenerator.next()
        viewer.displayNext(tetromino)
    }

    func tick() {
        viewer.moveDownOneRow(tetromino)
    }
}