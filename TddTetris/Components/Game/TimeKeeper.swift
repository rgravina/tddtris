import Foundation

protocol TimeKeeper {
    func update(now: NSTimeInterval) -> Bool
}