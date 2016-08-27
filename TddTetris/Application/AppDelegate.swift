import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let view = SpriteKitGameView()
        let actionSelector = DefaultActionSelector(
            view: view,
            tetrominoGenerator: DefaultTetrominoGenerator()
        )
        let tickHandler = DefaultTickHandler(
            timeKeeper: DefaultTimeKeeper(),
            actionSelector: actionSelector
        )
        let launcher = GameLauncher(
            view: view,
            tickHandler: tickHandler
        )
        let gameVC = GameViewController(launcher: launcher)

        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = gameVC
        window?.makeKeyAndVisible()

        return true
    }
}

