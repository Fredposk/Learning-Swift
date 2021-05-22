import Foundation
import Combine
import PlaygroundSupport


PlaygroundPage.current.needsIndefiniteExecution = true

var greeting = "Hello, playground"

var request = URLRequest(url: URL(string: "https://icanhazdadjoke.com/")!)

request.allHTTPHeaderFields = ["Accept": "text/plain"]

URLSession.shared.dataTaskPublisher(for: request)
    .retry(1)
    .receive(on: RunLoop.main)
    .sink ( receiveCompletion: {finished in
        switch finished {
        case .finished:
            print("no issues here")

        case .failure(_):
            print("error")
        }
    }, receiveValue: { data, response in
        print(String(data: data, encoding: .utf8) ?? Data())
    }
)

