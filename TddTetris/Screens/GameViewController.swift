import UIKit

class GameViewController: UIViewController {
    private let launcher: Launcher!

    init(launcher: Launcher) {
        self.launcher = launcher
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
        addSubviews()
    }

    private func configureSubviews() {
        launcher.configure(view.frame)
        launcher.start()
    }

    private func addSubviews() {
        view.addSubview(launcher.view)
    }
}
