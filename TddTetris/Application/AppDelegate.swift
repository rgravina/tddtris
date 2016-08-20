import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let view = SpriteKitGameView()
        let tickHandler = DefaultTickHandler(
            view: view,
            tetrominoGenerator: DefaultTetrominoGenerator(),
            timeKeeper: DefaultTimeKeeper()
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

