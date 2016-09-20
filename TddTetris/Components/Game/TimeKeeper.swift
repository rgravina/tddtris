import Foundation

protocol TimeKeeper {
    func update(_ now: TimeInterval) -> Bool
}
