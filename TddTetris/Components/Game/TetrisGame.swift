import UIKit
import SpriteKit

class TetrisGame: NSObject, Game, SKSceneDelegate {
    private let viewer: GameView!
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
        viewer.configure(self, frame: frame)
    }

    var view: UIView {
        get {
            return viewer.view
        }
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