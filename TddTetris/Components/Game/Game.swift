import UIKit

protocol Game {
    var view: UIView { get }
    func configure(frame: CGRect)
    func update(currentTime: NSTimeInterval)
    func start()
    func tick()
}
