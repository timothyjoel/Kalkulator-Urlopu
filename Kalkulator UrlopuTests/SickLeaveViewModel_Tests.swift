//  Created by Tymoteusz Stokarski on 17/11/2020.
//

@testable import Kalkulator_Urlopu
import XCTest

class SickLeaveViewModel_Tests: XCTestCase {
    
    func test_WhenQueryHasDefaultValues_ResultMoneyEquals2800() {
        let sut = makeSUT()
        XCTAssertEqual(sut.result, 2800)
    }
    
    func test_WhenQueryHasDaysOnSickLeave20__Money2800() {
        let sut = makeSUT(daysOnSickLeave: 20)
        XCTAssertEqual(Int(sut.result), 1866)
    }
    
    func test_WhenQueryHasMoneyPerMonth7000__Money2800() {
        let sut = makeSUT(moneyPerMonth: 7000)
        XCTAssertEqual(sut.result, 5600)
    }
    
    func test_WhenTwoChildrenAreBorn_CalculateAvailableLeave() {
    }
    
    // MARK: - Helpers
    func makeSUT(moneyPerMonth: Int = 3500, percentage: Int = 80, daysOnSickLeave: Int = 30, sickLeaveReason: SickLeaveReason = .regularSickness) -> SickLeaveViewModel {
        let sut = SickLeaveViewModel()
        sut.query.moneyPerMonth = moneyPerMonth
        sut.query.daysOnSickLeave = daysOnSickLeave
        sut.query.sickLeaveReason = sickLeaveReason
        return sut
    }
  
}
