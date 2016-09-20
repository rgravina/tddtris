import UIKit

protocol Launcher {
    var view: UIView { get }
    func configure(_ frame: CGRect)
    func start()
}
