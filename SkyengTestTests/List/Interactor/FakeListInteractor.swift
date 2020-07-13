@testable import SkyengTest
import Foundation // swiftlint:disable:this foundation_using

final class FakeInteractorOutput: ListInteractorOutput {
    var responses: [SearchResponse]?
    var error: NSError?
    
    func didSucceedToObtain(meaningsArray: [SearchResponse]) {
        responses = meaningsArray
    }
    
    func didFailToObtainMeanings(error: NSError) {
        self.error = error
    }
}
