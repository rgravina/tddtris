import UIKit

class GameLauncher: Launcher {
    fileprivate let gameView: GameView
    fileprivate let tickHandler: TickHandler
    fileprivate let inputHandler: InputHandler

    var view: UIView {
        get {
            return gameView.view
        }
    }

    init (
        view: GameView,
        tickHandler: TickHandler,
        inputHandler: InputHandler
    ) {
        self.gameView = view
        self.tickHandler = tickHandler
        self.inputHandler = inputHandler
    }

    func configure(_ frame: CGRect) {
        gameView.configure(
            tickHandler,
            inputHandler: inputHandler,
            frame: frame
        )
    }

    func start() {
        gameView.presentScene()
    }
}
