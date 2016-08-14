import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let game = TetrisGame(
            viewer: SpriteKitGameView(),
            blockGenerator: DefaultBlockGenerator(),
            timeKeeper: DefaultTimeKeeper()
        )
        let gameVC = GameViewController(game: game)

        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = gameVC
        window?.makeKeyAndVisible()

        return true
    }
}

