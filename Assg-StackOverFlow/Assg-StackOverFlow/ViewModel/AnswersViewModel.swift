//
//  AnswersViewModel.swift
//  Assg-StackOverFlow
//
//  Created by Dinesh Danda on 2/8/21.
//  Copyright © 2021 Dinesh Danda. All rights reserved.
//

import Foundation
class AnswersViewModel {
    var answers:DataModel?

    func filterAcceptedAnswers() -> [Item]? {
        return self.answers?.items.filter{$0.isAccepted == true}.filter{$0.score >= 2}
    }
}

extension AnswersViewModel {
    func fetchAnswers(completion: @escaping (Result<DataModel, Error>) -> Void) {
        HTTPManager.shared.get(urlString: baseUrl + answersUrl, completionBlock: { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .failure(let error):
                print ("failure", error)
                completion(.failure(error))

            case .success(let dta) :
                let decoder = JSONDecoder()
                do
                {
                    self.answers = try decoder.decode(DataModel.self, from: dta)
                    completion(.success(try decoder.decode(DataModel.self, from: dta)))
                } catch {
                }
            }
        })
    }
}
