//
//  main.swift
//  schau-maschine
//
//  Created by Bernhard Eiling on 24.12.16.
//
//

import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import Foundation
import RxSwift
import RxCocoa

let server = HTTPServer()

var routes = Routes()
routes.add(method: .get, uri: "/") {
    request, response in
    response.setHeader(.contentType, value: "text/html")
    response.appendBody(string: "<html><title>Hello, world yolo!</title><body>Hello, world, bolo!</body></html>")
    response.completed()
}

server.addRoutes(routes)
server.serverPort = 8181
server.documentRoot = "./webroot"

do {
    let disposeBag = DisposeBag()
    
// paste any www.schaubuehne.de event url here
    let url = URL(string: "https://www.schaubuehne.de/de/produktionen/wallenstein.html/ID_Vorstellung=2141")!
    
    Observable<Int>.interval(5, scheduler: ConcurrentDispatchQueueScheduler(qos: .default))
        .subscribe { _ in
            URLSession.shared.rx
                .response(request: URLRequest(url: url))
                .observeOn(ConcurrentDispatchQueueScheduler(qos: .default))
                .subscribe(onNext: { response in
                    guard let responseString = String(data: response.1, encoding: .utf8) else { return }
                    let ticketAvailabilities = HTMLParser.parse(htmlString: responseString)
                })
                .addDisposableTo(disposeBag)
        }
        .addDisposableTo(disposeBag)
    
    try server.start()
} catch PerfectError.networkError(let err, let msg) {
    print("Network error thrown: \(err) \(msg)")
    
}
