import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let view = SpriteKitGameView()
        let gameState = GameState()
        let collisionDetector = DefaultCollisionDetector(
            state: gameState
        )

        let tickHandler = DefaultTickHandler(
            timeKeeper: DefaultTimeKeeper(),
            actionSelector: DefaultActionSelector(
                view: view,
                state: gameState,
                tetrominoGenerator: DefaultTetrominoGenerator(),
                collisionDetector: collisionDetector
            ),
            gameState: gameState
        )

        let gameVC = GameViewController(
            launcher: GameLauncher(
                view: view,
                tickHandler: tickHandler,
                inputHandler: DefaultInputHandler(
                    view: view,
                    gameState: gameState,
                    collisionDetector: collisionDetector
                )
            )
        )

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = gameVC
        window?.makeKeyAndVisible()

        return true
    }
}

