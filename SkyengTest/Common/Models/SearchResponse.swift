struct SearchResponse: Decodable, ViewModelProtocol, Equatable {
    let text: String
    let meanings: [Meaning]
}

struct Meaning: Decodable, ViewModelProtocol, Equatable {
    let translation: Translation
    let transcription: String
    let imageUrl: String?
    let soundUrl: String?
    
    struct Translation: Decodable, Equatable {
        let text: String
    }
}
