//  Created by Tymoteusz Stokarski on 21/11/2020.
//

@testable import Kalkulator_Urlopu
import XCTest

class SalaryBelow26ViewModel_Tests: XCTestCase {

    func test_WhenGrossSalarySet_CalculateNetSalary() {
        let sut = makeSUT(salary: 5000)
        XCTAssertEqual(sut.netSalary, 3926.195)
    }
    
    // MARK: - Helpers
    func makeSUT(salary: Int) -> SalaryBelow26yViewModel {
        let sut = SalaryBelow26yViewModel()
        sut.grossSalary = salary
        return sut
    }

}
