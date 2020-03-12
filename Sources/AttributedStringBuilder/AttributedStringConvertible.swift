//
//  AttributedStringConvertible.swift
//  
//
//  Created by Ben Leggiero on 2020-03-11.
//

import Foundation



/// Something which can be converted to an `NSAttributedString`
public protocol AttributedStringConvertible {
    
    /// Returns this object as an `NSAttributedString`
    var attributed: NSAttributedString { get }
}



// MARK: - Default Conformances

extension String: AttributedStringConvertible {
    
    /// Returns this string as an `NSAttributedString`
    @inlinable
    public var attributed: NSAttributedString {
        NSAttributedString(string: self)
    }
}



extension NSAttributedString: AttributedStringConvertible {
    
    /// Simply returns itself
    @inline(__always)
    public var attributed: NSAttributedString { self }
}



extension NSString: AttributedStringConvertible {
    
    /// Returns this string as an `NSAttributedString`
    @inlinable
    public var attributed: NSAttributedString {
        NSAttributedString(string: self as String)
    }
}
