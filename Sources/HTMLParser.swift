//
//  HTMLParser.swift
//  schau-maschine
//
//  Created by Bernhard Eiling on 25.12.16.
//
//

import Foundation
import PerfectXML

class HTMLParser {
    
    class func parse(htmlString: String) -> [(String?, Bool)?]? {
        guard let performancesDiv = HTMLDocument(fromSource: htmlString)?.getElementById("furtherperformances") else { return nil }
        return performancesDiv.childNodes
            .filter { element in
                guard let element = element as? XElement else { return false }
                return element.getAttribute(name: "class") == "further"
            }
            .map { element -> (String?, Bool)? in
                let element = element as! XElement
                let linkTagElements = element.getElementsByTagName("a")
                guard linkTagElements.count > 1 else { return nil}
                let dateString = linkTagElements[0].nodeValue
                var available: Bool = false
                if linkTagElements[1].getAttribute(name: "title") == "Ticket",
                    let className = linkTagElements[1].getAttribute(name: "class") {
                    available = !className.contains(string: "ausverkauft")
                }
                return (dateString, available)
        }
    }
    
}
