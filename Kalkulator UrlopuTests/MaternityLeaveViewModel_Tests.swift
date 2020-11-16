//  Created by Tymoteusz Stokarski on 15/11/2020.
//

@testable import Kalkulator_Urlopu
import XCTest

class MaternityLeaveViewModel_Tests: XCTestCase {
    
    func test_WhenOneChildIsBorn_CalculateAvailableLeave() {
        let sut = makeSUT(kidsBorn: 1)
        let result = MaternityLeaveResult(
            maternityLeave: 20,
            maternityLeaveStartDate: "15.11.2020",
            maternityLeaveFinishDate: "03.04.2021",
            parentalLeave: 32,
            parentalLeaveStartDate: "04.04.2021",
            parentalLeaveFinishDate: "13.11.2021",
            summedLeave: 52)
        XCTAssertEqual(sut.result, result)
    }
    
    func test_WhenTwoChildrenAreBorn_CalculateAvailableLeave() {
        let sut = makeSUT(kidsBorn: 2)
        let result = MaternityLeaveResult(
            maternityLeave: 31,
            maternityLeaveStartDate: "15.11.2020",
            maternityLeaveFinishDate: "19.06.2021",
            parentalLeave: 34,
            parentalLeaveStartDate: "20.06.2021",
            parentalLeaveFinishDate: "12.02.2022",
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
