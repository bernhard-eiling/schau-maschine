//
//  HTMLMock.swift
//  schau-maschine
//
//  Created by Bernhard Eiling on 27.12.16.
//
//

import Foundation

class HTMLMock {
    
    class func validMockHTML() -> String {
        return "<body><div id='furtherperformances' class='contentTextInner'><h1>Termine</h1><span class='red'>Mit englischen Übertiteln</span>                                    <br /><div class='further'><div class='stueck_left smallLetters'><a href='./produktionen/richardiii.html/ID_Vorstellung=2191'>31.01.2017,19.30 - 22.00</a>                                        </div><div class='stueck_right alternativeLink ticketlink'><a href='javascript:void(0);' title='Ticket' class='ausverkauft red'>&gt; Ticket</a></div>                                        <div class='clear'></div></div><div class='further'><div class='stueck_left smallLetters'><a href='./produktionen/richardiii.html/ID_Vorstellung=2192'>01.02.2017,19.30 - 22.00</a></div><div class='stueck_right alternativeLink ticketlink'><a href='javascript:void(0);' title='Ticket' class='ausverkauft red'>&gt; Ticket</a></div><div class='clear'></div></div></div></body>"
    }
    class func invalidMockHTML() -> String {
        return "<body><div id='furtherperformances' class='contentTextInner'><h1>Termine</h1><div class='further'><div class='stueck_left smallLetters'><a href='./produktionen/richardiii.html/ID_Vorstellung=2191'>31.01.2017,19.30 - 22.00</a>                                        </div><div class='stueck_right alternativeLink ticketlink'></div>                                        <div class='clear'></div></div></div></body>"
    }
    
}
