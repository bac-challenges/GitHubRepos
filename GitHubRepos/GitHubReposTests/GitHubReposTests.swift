//
//  GitHubReposTests.swift
//  GitHubReposTests
//
//  Created by emile on 20/02/2021.
//

@testable import GitHubRepos
import XCTest
import Combine

class GitHubReposTests: XCTestCase,
                        ListControllerInjected,
                        ListViewModelInjected,
                        ListModelInjected,
                        ServiceInjected,
                        JSONDecoderInjected {

    private var disposables: Set<AnyCancellable> = []
    
    override func setUpWithError() throws {
        InjectionMap.service = ServiceMock()
        InjectionMap.listModel = ListModelMock()
        InjectionMap.listViewModel = ListViewModel()
        InjectionMap.listController = ListController()
    }

    override func tearDownWithError() throws {
        disposables = []
    }

    func testService() throws {
        service.get(EndPoint.mock)
            .sink { error in
                print(error)
            } receiveValue: { data in
                XCTAssertNotNil(data)
            }
            .store(in: &disposables)
    }
    
    func testModel() throws {
        listModel.get()
            .replaceError(with: [])
            .eraseToAnyPublisher()
            .sink(receiveValue: { items in
                XCTAssertNotNil(items)
                XCTAssertEqual(items.count, 3)
                
                guard  let item = items.first else {
                    XCTFail()
                    return
                }
                
                XCTAssertEqual(item.name, "name 1")
                XCTAssertEqual(item.desc, "description 1")
                XCTAssertEqual(item.login, "login 1")
            })
            .store(in: &disposables)
    }
    
    func testViewModel() throws {
        listViewModel.get()
        listViewModel.$items
            .sink { items in
                XCTAssertEqual(items.count, 3)
                
                guard  let item = items.first else {
                    XCTFail()
                    return
                }
                
                XCTAssertEqual(item.name, "name 1")
                XCTAssertEqual(item.desc, "description 1")
                XCTAssertEqual(item.login, "login 1")
            }
            .store(in: &disposables)
    }
}
