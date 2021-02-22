//
//  ListModel.swift
//  GitHubRepos
//
//  Created by emile on 20/02/2021.
//

import Foundation
import Combine

protocol ListModelType: ServiceInjected, JSONDecoderInjected {
    func get() -> AnyPublisher<[Repo], Error>
}

struct ListModel: ListModelType {
    func get() -> AnyPublisher<[Repo], Error> {
        return service.get(EndPoint.remote)
            .decode(type: [Repo].self, decoder: jsonDecoder)
            .eraseToAnyPublisher()
    }
}

struct ListModelMock: ListModelType {
    func get() -> AnyPublisher<[Repo], Error> {
        return service.get(EndPoint.mock)
            .decode(type: [Repo].self, decoder: jsonDecoder)
            .eraseToAnyPublisher()
    }
}
