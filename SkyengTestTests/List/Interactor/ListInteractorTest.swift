import XCTest
@testable import SkyengTest

final class ListInteractorTest: XCTestCase {
    
    struct StubSearchResponseResult {
        static let response = [SearchResponse(text: "W", meanings: [
            Meaning(translation: Meaning.Translation(text: "запад"),
                    transcription: "ˈdʌblju(ː)",
                    imageUrl: "//d2zkmv5t5kao9.cloudfront.net/images/e6684573a8c423059cd4ab209443392c.jpeg?w=640&h=480",
                    soundUrl: "//d2fmfepycn0xw0.cloudfront.net?gender=male&accent=british&text=w")
        ])
        ]
        
        static let errorResult: Result<[SearchResponse], Error> = .failure(NSError(domain: "HttpResponseErrorDomain", code: 401, userInfo: nil))
        static let succeessfulResult: Result<[SearchResponse], Error> = .success(StubSearchResponseResult.response)
    }
    
    var interactor: ListInteractor!
    let meaningService = FakeMeaningService()
    let presenter = FakeInteractorOutput()
    
    override func setUp() {
        interactor = ListInteractor(meaningService: meaningService)
        interactor.presenter = presenter
    }
    
    func test_FetchMeaningsWithSuccess() {
        loadResponseListWithSuccess()
        XCTAssertEqual(StubSearchResponseResult.response, presenter.responses)
    }
    
    func test_FetchMeaningsWithError() {
        loadResponseListWithError()
        switch StubSearchResponseResult.errorResult {
        case .failure(let error):
            XCTAssertEqual(error.localizedDescription, presenter.error?.localizedDescription)
        default:
            XCTFail("Should be case failure instead success")
        }
    }
    
    func test_SearchText() {
        let testText = "Test text"
        meaningService.meaningResult = StubSearchResponseResult.succeessfulResult
        interactor.obtainMeanings(with: testText)
        XCTAssertEqual(meaningService.searchText, testText)
    }
    
    // MARK: Helpers
    
    private func loadResponseListWithSuccess() {
        meaningService.meaningResult = StubSearchResponseResult.succeessfulResult
        interactor.obtainMeanings(with: "")
    }
    
    private func loadResponseListWithError() {
        meaningService.meaningResult = StubSearchResponseResult.errorResult
        interactor.obtainMeanings(with: "")
    }
}
