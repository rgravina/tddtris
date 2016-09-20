import UIKit

class GameViewController: UIViewController {
    fileprivate let launcher: Launcher!

    init(launcher: Launcher) {
        self.launcher = launcher
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var prefersStatusBarHidden : Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
        addSubviews()
    }

    fileprivate func configureSubviews() {
        launcher.configure(view.frame)
        launcher.start()
    }

    fileprivate func addSubviews() {
        view.addSubview(launcher.view)
    }
}
