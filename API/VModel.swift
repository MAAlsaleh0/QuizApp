//
//  VModel.swift
//  API
//
//  Created by Mohammed Alsaleh on 25/03/1443 AH.
//

import Foundation


struct DataJson: Codable , Hashable {
    var questions: [Question]
}


struct Question: Codable , Hashable{
    var id: Int
    var question: String
    var answers: [String]
    var correctIndex: Int
}

class ViewModel : ObservableObject {
   private var data: Data? = .init(count:0)
    @Published var JSONDataDecoder1 : [Question] = []
    func GetData() {
        if let url = Bundle.main.url(forResource: "Data", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(DataJson.self, from: data)
            
            JSONDataDecoder1.append(contentsOf: jsonData.questions)
            } catch {
                print("decode error")
            }
    }
}
}
