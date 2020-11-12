//  Created by Tymoteusz Stokarski on 12/11/2020.
//

@testable import Kalkulator_Urlopu
import XCTest

class DaysOffViewModel_Tests: XCTestCase {

    func test_WhenBeginDate_isBeforeEndDate_timePeriodIsValid() {
        let sut = makeSUT(testedCase: .oneMonth)
        XCTAssertTrue(sut.isValidQuery, "Valid query search")
    }
    
    func test_WhenBeginDate_isAfterEndDate_timePeriodIsNotValid() {
        let sut = makeSUT(testedCase: .wrongDates)
        XCTAssertFalse(sut.isValidQuery, "Is not valid query search")
    }
    
    func test_WhenWorkedLessThan10Years_daysOfInYearEquals20() {
        let sut = makeSUT(testedCase: .oneMonth)
        sut.query.workedLessThanTenYears = true
        XCTAssertEqual(sut.result.daysOffInYear, 20)
    }
    
    func test_WhenWorkedMoreThan10Years_daysOfInYearEquals26() {
        let sut = makeSUT(testedCase: .oneMonth)
        sut.query.workedLessThanTenYears = false
        XCTAssertEqual(sut.result.daysOffInYear, 26)
    }
    
    func test_WhenWorkedUpToOneMonth_setWorkedOneMonth() {
        let sut = makeSUT(testedCase: .oneMonth)
        XCTAssertEqual(sut.result.workedMonths, 1)
    }
    
    func test_WhenWorkedUpToOneMonth_setTwoDaysOff() {
        let sut = makeSUT(testedCase: .oneMonth)
        XCTAssertEqual(sut.result.daysOff, 2)
    }
    
    func test_WhenWorkedUpToOneMonth_partTime_setOneDayOff() {
        let sut = makeSUT(testedCase: .oneMonth)
        sut.query.workingTime =  2
        XCTAssertEqual(sut.result.daysOff, 1)
    }
    
    func test_WhenWorkedTwoMonths_setWorkedTwoMonths() {
        let sut = makeSUT(testedCase: .twoMonths)
        XCTAssertEqual(sut.result.workedMonths, 2)
    }
    
    func test_WhenWorkedTwoMonths_setFourDaysOff() {
        let sut = makeSUT(testedCase: .twoMonths)
        XCTAssertEqual(sut.result.daysOff, 4)
    }
    
    func test_WhenWorkedTwoMonths_partTime_setTwoDaysOff() {
        let sut = makeSUT(testedCase: .twoMonths)
        sut.query.workingTime = 2
        XCTAssertEqual(sut.result.daysOff, 2)
    }
    
    func test_WhenWorkedThreeMonths_setWorkedThreeMonths() {
        let sut = makeSUT(testedCase: .threeMonths)
        XCTAssertEqual(sut.result.workedMonths, 3)
    }
    
    func test_WhenWorkedThreeMonths_setFiveDaysOff() {
        let sut = makeSUT(testedCase: .threeMonths)
        XCTAssertEqual(sut.result.daysOff, 5)
    }
    
    func test_WhenWorkedThreeMonths_partTime_setTwoDaysOff() {
        let sut = makeSUT(testedCase: .threeMonths)
        sut.query.workingTime = 2
        XCTAssertEqual(sut.result.daysOff, 3)
    }
    
    // MARK: - Helpers
    func makeSUT(testedCase: TestedCase) -> DaysOffViewModel {
        let sut =  DaysOffViewModel()
        switch testedCase {
        case .wrongDates:
            sut.query.beginDate = Date(day: 10, month: 11, year: 2020)
            sut.query.endDate = Date(day: 8, month: 11, year: 2020)
        case .oneMonth:
            sut.query.beginDate = Date(day: 10, month: 11, year: 2020)
            sut.query.endDate = Date(day: 28, month: 11, year: 2020)
        case .twoMonths:
            sut.query.beginDate = Date(day: 10, month: 10, year: 2020)
            sut.query.endDate = Date(day: 28, month: 11, year: 2020)
        case .threeMonths:
            sut.query.beginDate = Date(day: 10, month: 9, year: 2020)
            sut.query.endDate = Date(day: 28, month: 11, year: 2020)
        }
        return sut
    }
    
    enum TestedCase {
        case wrongDates
        case oneMonth
        case twoMonths
        case threeMonths
    }
    
}
