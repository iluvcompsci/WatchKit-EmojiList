//
//  InterfaceController.swift
//  EmojiList WatchKit Extension
//
//  Created by Bri Chapman on 4/6/15.
//  Copyright (c) 2015 edu.illinois. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var table: WKInterfaceTable!
    
    var emojis : [String] = []
    override init() {
        let emojiRanges = [
            0x1F601...0x1F64F,
            0x2702...0x27B0,
            0x1F680...0x1F6C0,
            0x1F170...0x1F251
        ]
        //via http://en.wikipedia.org/wiki/Emoji#In_the_Unicode_standard
        
        for range in emojiRanges {
            for i in range {
                var c = String(UnicodeScalar(i))
                emojis.append("\(c)")
            }
        }
        
        self.table.setNumberOfRows(emojis.count, withRowType: "EmojiRow")
        
        for index in 0..<self.emojis.count {
            var theRow = self.table.rowControllerAtIndex(index) as EmojiRow
            println(emojis[index])
            theRow.emojiTitle.setText(emojis[index])
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        NSLog("%@ will activate", self)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        NSLog("%@ did deactivate", self)
        super.didDeactivate()
    }

}
