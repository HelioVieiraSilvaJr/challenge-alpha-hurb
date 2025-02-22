//
//  SearchViewControllerTest.swift
//  Challenge_iOSTests
//
//  Created by Helio Junior on 14/11/22.
//

import XCTest
@testable import Challenge_iOS

class SearchViewControllerTest: XCTestCase {

    var sut: SearchViewController!
    var viewModel: SearchViewModel!
    
    override func setUpWithError() throws {
        let serviceStub = SearchServiceSuccessStub()
        viewModel = SearchViewModel(service: serviceStub)
        sut = SearchViewController(viewModel: viewModel)
        _ = sut.view
    }

    override func tearDownWithError() throws {
        sut = nil
        viewModel = nil
    }
    
    func test_WhenSearchTerm_TableViewSuccessRenderCells() {
        viewModel.fetchSearchFrom(query: "")
        
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 2)
    }
    
    func test_WhenSearchTermNotExist_TableViewFailureRenderCells() {
        let serviceStub = SearchServiceFailureStub()
        viewModel = SearchViewModel(service: serviceStub)
        sut = SearchViewController(viewModel: viewModel)
        _ = sut.view
        
        viewModel.fetchSearchFrom(query: "")
        
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
    }

    func test_WhenSearchTerm_TableViewRenderCellsAndIdentifierHotelCell() {
        viewModel.fetchSearchFrom(query: "")
        let indexPath = IndexPath(row: 0, section: 0)
        let tableView = sut.tableView!
        
        if let cell = sut.tableView(tableView, cellForRowAt: indexPath) as? CardHotelTableViewCell {
            XCTAssertEqual(cell.labelName.text, "Imperial Plaza Hotel")
            XCTAssertEqual(cell.labelAddress.text, "Brasília, Brasil")
            XCTAssertEqual(cell.labelValue.text, "R$ 158")
        }
    }
    
    func test_WhenSearchTerm_TableViewRenderCellsAndIdentifierPackageCell() {
        viewModel.fetchSearchFrom(query: "")
        let indexPath = IndexPath(row: 1, section: 0)
        let tableView = sut.tableView!
        
        if let cell = sut.tableView(tableView, cellForRowAt: indexPath) as? CardPackageTableViewCell {
            XCTAssertEqual(cell.labelName.text, "Pacote de Viagem - CDesign Hotel (Rio de Janeiro) - 2023")
            XCTAssertEqual(cell.labelDailys.text, "1 diária")
            XCTAssertEqual(cell.labelPersons.text, "2 pessoas")
        }
    }
    
    func test_WhenBeginSearch_ShowSearchSuggestionsView() {
        let searchBar = sut.searchController.searchBar
        _ = sut.searchController.searchBar.delegate?.searchBarShouldBeginEditing?(searchBar)

        XCTAssertFalse(sut.viewSearchSuggestions.isHidden)
    }
    
    func test_WhenBeginAndEndSearch_ThenHideSearchSuggestionsView() {
        let searchBar = sut.searchController.searchBar
        _ = sut.searchController.searchBar.delegate?.searchBarShouldBeginEditing?(searchBar)
        sut.searchController.searchBar.delegate?.searchBarTextDidEndEditing?(searchBar)

        XCTAssertTrue(sut.viewSearchSuggestions.isHidden)
    }
    
    func test_WhenClickedButtonCancel_ThenHideSearchSuggestionsView() {
        let searchBar = sut.searchController.searchBar
        _ = sut.searchController.searchBar.delegate?.searchBarShouldBeginEditing?(searchBar)
        sut.searchController.searchBar.delegate?.searchBarCancelButtonClicked?(searchBar)
        
        XCTAssertTrue(sut.viewSearchSuggestions.isHidden)
    }
    
    func test_WhenFailureSearch_ThenShowSearchNotFoundView() {
        let promesse = expectation(description: "View de Resultado não encontrado deve ser exibida.")
        let serviceStub = SearchServiceFailureStub()
        viewModel = SearchViewModel(service: serviceStub)
        sut = SearchViewController(viewModel: viewModel)
        _ = sut.view
        
        viewModel.fetchSearchFrom(query: "")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) {
            XCTAssertFalse(self.sut.viewSearchNotFound.isHidden)
            promesse.fulfill()
        }
        wait(for: [promesse], timeout: 1)
    }
    
    func test_WhenClickedOnButtonSearchKeyboard_ThenSearchAndLoadResults() {
        let searchBar = sut.searchController.searchBar
        _ = sut.searchController.searchBar.delegate?.searchBarShouldBeginEditing?(searchBar)
        sut.searchController.searchBar.delegate?.searchBar?(searchBar, textDidChange: "Rio de Janeiro")
        sut.searchController.searchBar.delegate?.searchBarSearchButtonClicked?(searchBar)

        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 2)
    }
    
    func test_WhenClickedOnSuggestion_ThenSearchAndLoadResults() {
        let searchBar = sut.searchController.searchBar
        _ = sut.searchController.searchBar.delegate?.searchBarShouldBeginEditing?(searchBar)
        sut.searchController.searchBar.delegate?.searchBar?(searchBar, textDidChange: "Rio de Janeiro")
        
        sut.viewSearchSuggestions.didSelectedSuggestion?(SuggestionModel(text: "Rio de Janeiro"))

        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 2)
    }
}
