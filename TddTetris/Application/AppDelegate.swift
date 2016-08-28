import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let view = SpriteKitGameView()

        let tickHandler = DefaultTickHandler(
            timeKeeper: DefaultTimeKeeper(),
            actionSelector: DefaultActionSelector(
                view: view,
                tetrominoGenerator: DefaultTetrominoGenerator(),
                collisionDetector: DefaultCollisionDetector()
            )
        )

        let gameVC = GameViewController(
            launcher: GameLauncher(
                view: view,
                tickHandler: tickHandler
            )
        )

        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = gameVC
        window?.makeKeyAndVisible()

        return true
    }
}

