import XCTest
import Nimble
@testable import TddTetris

class DefaultTimeKeeperTest: XCTestCase {
    var timeKeeper: DefaultTimeKeeper!

    override func setUp() {
        timeKeeper = DefaultTimeKeeper()
    }

    func test_timesup_falseWhenLessThanTickLength() {
        expect(self.timeKeeper.update(CFTimeInterval(0))).to(equal(false))
    }

    func test_timesup_trueWhenGreaterThanTickLength() {
        expect(self.timeKeeper.update(CFTimeInterval(0))).to(equal(false))
        expect(self.timeKeeper.update(CFTimeInterval(0.6))).to(equal(true))
    }

    func test_timesup_updatesLastTickAt() {
        expect(self.timeKeeper.update(CFTimeInterval(0))).to(equal(false))
        expect(self.timeKeeper.update(CFTimeInterval(0.6))).to(equal(true))
        expect(self.timeKeeper.update(CFTimeInterval(0.7))).to(equal(false))
        expect(self.timeKeeper.update(CFTimeInterval(1.2))).to(equal(true))
    }
}
