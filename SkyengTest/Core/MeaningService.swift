import Foundation // swiftlint:disable:this foundation_using

protocol MeaningService: AnyObject {
    func fetchMeanings(searchText: String, completion: @escaping (Result<[SearchResponse], Error>) -> Void)
}

final class MeaningServiceImp: MeaningService {
    
    private let baseUrlString = "https://dictionary.skyeng.ru/api/public/v1/"
    
    func fetchMeanings(searchText: String, completion: @escaping (Result<[SearchResponse], Error>) -> Void) {
        guard let url = URL(string: baseUrlString + "words/search") else {
            completion(.failure(NSError(domain: "Error", code: 0, userInfo: nil)))
            return
        }
        URLSession.shared.dataTask(with: url.appending("search", value: searchText)) { result in
            switch result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode([SearchResponse].self, from: data)
                    completion(.success(response))
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }.resume()
    }
}
