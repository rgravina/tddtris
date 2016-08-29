import UIKit

class GameLauncher: Launcher {
    private let gameView: GameView
    private let tickHandler: TickHandler
    private let inputHandler: InputHandler

    var view: UIView {
        get {
            return gameView.view
        }
    }

    init (view: GameView,
          tickHandler: TickHandler,
          inputHandler: InputHandler
    ) {
        self.gameView = view
        self.tickHandler = tickHandler
        self.inputHandler = inputHandler
    }

    func configure(frame: CGRect) {
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