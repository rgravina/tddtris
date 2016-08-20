import UIKit

protocol Launcher {
    var view: UIView { get }
    func configure(frame: CGRect)
    func start()
}
