import UIKit

class TetrisGame: Game {
    private let viewer: GameView!
    private let tetrominoGenerator: TetrominoGenerator!
    private let timeKeeper: TimeKeeper!
    private var tetromino: Tetromino!
    var view: UIView {
        get {
            return viewer.view
        }
    }

    init(viewer: GameView,
         tetrominoGenerator: TetrominoGenerator,
         timeKeeper: TimeKeeper
        ) {
        self.viewer = viewer
        self.tetrominoGenerator = tetrominoGenerator
        self.timeKeeper = timeKeeper
    }

    func configure(frame: CGRect) {
        viewer.configure(self, frame: frame)

    }
    func update(currentTime: NSTimeInterval) {
        if (timeKeeper.update(currentTime)) {
            tick()
        }
    }


    func start() {
        viewer.presentScene()
        tetromino = tetrominoGenerator.next()
        viewer.displayNext(tetromino)
    }

    func tick() {
        viewer.moveDownOneRow(tetromino)
    }
}