import XCTest
@testable import SkyengTest

final class FakeMeaningService: MeaningService {
    var meaningResult: Result<[SearchResponse], Error>?
    var searchText: String?
    
    func fetchMeanings(searchText: String, completion: @escaping (Result<[SearchResponse], Error>) -> Void) {
        guard let result = meaningResult else {
            XCTFail("Didnot supply fake result in Fake MovieList Client")
            return
        }
        self.searchText = searchText
        completion(result)
    }
}
