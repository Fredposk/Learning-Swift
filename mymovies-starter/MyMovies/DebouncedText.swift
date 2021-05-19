//
//  DebouncedText.swift
//  MyMovies
//
//  Created by Frederico Kuckelhaus on 19.05.21.
//

import Foundation
import Combine

class DebouncedText: ObservableObject {
    @Published var text = ""
    @Published var debouncedText = ""


    private var textDebounce: AnyCancellable?


    init() {
        textDebounce = $text
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink {
                self.debouncedText = $0
            }
    }
}
