import UIKit

protocol Game {
    var view: UIView { get }
    func configure(frame: CGRect)
    func start()
    func tick()
}
