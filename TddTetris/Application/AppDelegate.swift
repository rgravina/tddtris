import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let gameVC = GameViewController(viewer: GameViewer())

        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = gameVC
        window?.makeKeyAndVisible()

        return true
    }
}

