//
//  Collection+Povio.swift
//  PovioKit
//
//  Created by Povio on 12/03/2018.
//  Copyright © 2018 Povio Labs. All rights reserved.
//

import Foundation

public extension Collection {
	/// Returns the element at the specified `index` if it is within bounds, otherwise `nil`.
	subscript (safe index: Index) -> Element? {
		return indices.contains(index) ? self[index]: nil
	}
  
	/// Conditional element count - https://github.com/apple/swift-evolution/blob/master/proposals/0220-count-where.md
	func count(where clause: (Element) -> Bool) -> Int {
		return lazy.filter(clause).count
	}
}
