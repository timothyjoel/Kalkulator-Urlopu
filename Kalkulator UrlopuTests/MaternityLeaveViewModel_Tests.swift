//  Created by Tymoteusz Stokarski on 15/11/2020.
//

@testable import Kalkulator_Urlopu
import XCTest

class MaternityLeaveViewModel_Tests: XCTestCase {
    
    func test_WhenOneChildIsBorn_CalculateAvailableLeave() {
        let sut = makeSUT(kidsBorn: 1)
        let result = MaternityLeaveResult(
            maternityLeave: 20,
            maternityLeaveStartDate: Date(day: 15, month: 11, year: 2020),
            maternityLeaveFinishDate: Date(day: 3, month: 4, year: 2021),
            parentalLeave: 32,
            parentalLeaveStartDate: Date(day: 4, month: 4, year: 2021),
            parentalLeaveFinishDate: Date(day: 13, month: 11, year: 2021),
            summedLeave: 52)
        XCTAssertEqual(sut.result, result)
    }
    
    func test_WhenTwoChildrenAreBorn_CalculateAvailableLeave() {
        let sut = makeSUT(kidsBorn: 2)
        let result = MaternityLeaveResult(
            maternityLeave: 31,
            maternityLeaveStartDate: Date(day: 15, month: 11, year: 2020),
            maternityLeaveFinishDate: Date(day: 19, month: 6, year: 2021),
            parentalLeave: 34,
            parentalLeaveStartDate: Date(day: 20, month: 6, year: 2021),
            parentalLeaveFinishDate: Date(day: 12, month: 2, year: 2022),
            summedLeave: 65)
        XCTAssertEqual(sut.result, result)
    }
    
    // MARK: - Helpers
    func makeSUT(kidsBorn: Int) -> MaternityLeaveViewModel {
        let sut = MaternityLeaveViewModel()
        sut.query.numberOfKidsBorn = kidsBorn
        sut.query.birthDate = Date(day: 15, month: 11, year: 2020)
        return sut
    }
  
}
