import XCTest
import Nimble
import SpriteKit
@testable import TddTetris

class DefaultTimeKeeperTest: XCTestCase {
    var timeKeeper: DefaultTimeKeeper!

    override func setUp() {
        timeKeeper = DefaultTimeKeeper()
    }

    func test_timesup_falseWhenLessThanTickLength() {
        let shortTime = CFTimeInterval(0)
        expect(self.timeKeeper.update(shortTime)).to(equal(false))
    }

    func test_timesup_trueWhenGreaterThanTickLength() {
        expect(self.timeKeeper.update(CFTimeInterval(0))).to(equal(false))
        let longTime = CFTimeInterval(0) + timeKeeper.tickLength
        expect(self.timeKeeper.update(longTime)).to(equal(true))
    }

    func test_timesup_updatesLastTickAt() {
        expect(self.timeKeeper.update(CFTimeInterval(0))).to(equal(false))
        let longTime = CFTimeInterval(0) + timeKeeper.tickLength
        expect(self.timeKeeper.update(longTime)).to(equal(true))
        expect(self.timeKeeper.lastTickAt).to(equal(longTime))
    }
}
