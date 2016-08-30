import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let view = SpriteKitGameView()
        let gameState = GameState()

        let tickHandler = DefaultTickHandler(
            timeKeeper: DefaultTimeKeeper(),
            actionSelector: DefaultActionSelector(
                view: view,
                tetrominoGenerator: DefaultTetrominoGenerator(),
                collisionDetector: DefaultCollisionDetector()
            ),
            gameState: gameState
        )

        let gameVC = GameViewController(
            launcher: GameLauncher(
                view: view,
                tickHandler: tickHandler,
                inputHandler: DefaultInputHandler(
                    view: view,
                    gameState: gameState
                )
            )
        )

        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = gameVC
        window?.makeKeyAndVisible()

        return true
    }
}

