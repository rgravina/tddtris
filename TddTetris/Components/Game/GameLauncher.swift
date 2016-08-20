import UIKit

class GameLauncher: Launcher {
    private let gameView: GameView
    private let tickHandler: TickHandler

    var view: UIView {
        get {
            return gameView.view
        }
    }

    init (view: GameView, tickHandler: TickHandler) {
        self.gameView = view
        self.tickHandler = tickHandler
    }

    func configure(frame: CGRect) {
        gameView.configure(tickHandler, frame: frame)

    }

    func start() {
        gameView.presentScene()
    }
}