//
//  SearchViewModel.swift
//  Challenge_iOS
//
//  Created by Helio Junior on 12/11/22.
//

import Foundation

final class SearchViewModel {
    // MARK: Properties
    private let service: SearchServiceProtocol
    private var suggestionsResults: [SuggestionModel] = []
    private var searchResults: [SearchResultModel] = []
    var didReturnSuggestions: (() -> Void)?
    var shouldUpdateUI: (() -> Void)?
    var shouldShowNotFound: (() -> Void)?
    
    // MARK: Initialization
    init(service: SearchServiceProtocol = SearchService()) {
        self.service = service
    }
    
    // MARK: Methods
    func getSuggestionsResults() -> [SuggestionModel] {
        suggestionsResults
    }
    
    func getSearchResults() -> [SearchResultModel] {
        searchResults
    }
    
    func getSuggestionsFrom(text: String) {
        service.getSuggestionsFrom(text: text) { response in
            switch response {
            case .success(let suggestions):
                self.suggestionsResults = suggestions
                self.didReturnSuggestions?()
            case .failure(let error):
                self.suggestionsResults = []
                print("==> ERROR: \(error.localizedDescription)")
            }
        }
    }
    
    func fetchSearchFrom(query: String) {
        service.fetchSearchFrom(query: query, pagination: 1) { response in
            switch response {
            case .success(let results):
                self.searchResults = results
                self.shouldUpdateUI?()
                
            case .failure:
                self.searchResults = []
                self.shouldUpdateUI?()
                self.shouldShowNotFound?()
            }
        }
    }
}
