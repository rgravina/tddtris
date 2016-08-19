import UIKit
import SpriteKit

class TetrisGame: NSObject, Game, SKSceneDelegate {
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

    func start() {
        viewer.presentScene()
        tetromino = tetrominoGenerator.next()
        viewer.displayNext(tetromino)
    }

    func update(currentTime: NSTimeInterval, forScene scene: SKScene) {
        if (timeKeeper.update(currentTime)) {
            tick()
        }
    }

    func tick() {
        viewer.moveDownOneRow(tetromino)
    }
}