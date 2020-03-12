//
//  Modifiers.swift
//  
//
//  Created by Carson Katri on 7/27/19.
//

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

import CrossKitTypes



public extension String {
    
    /// Sets the color of this text
    func foregroundColor(_ color: NativeColor) -> NSAttributedString {
        attributed.foregroundColor(color)
    }
    
    
    /// Sets the background color
    func background(_ color: NativeColor) -> NSAttributedString {
        attributed.background(color)
    }
    
    
    /// Applies an underline to the text
    func underline(_ color: NativeColor, style: NSUnderlineStyle = .single) -> NSAttributedString {
        attributed.underline(color, style: style)
    }
    
    
    /// Sets the font for this text
    func font(_ font: NativeFont) -> NSAttributedString {
        attributed.font(font)
    }
    
    
    /// Adds a shadow to this text
    func shadow(_ shadow: NSShadow) -> NSAttributedString {
        attributed.shadow(shadow)
    }
}



public extension NSAttributedString {
    
    /// Sets the color of this text
    func foregroundColor(_ color: NativeColor) -> Self {
        self.applying(.foregroundColor, value: color)
    }
    
    
    /// Sets the background color
    func background(_ color: NativeColor) -> Self {
        self.applying(.backgroundColor, value: color)
    }
    
    
    /// Applies an underline to the text
    func underline(_ color: NativeColor, style: NSUnderlineStyle = .single) -> Self {
        self.applying([.underlineColor: color, .underlineStyle: style.rawValue])
    }
    
    
    /// Sets the font for this text
    func font(_ font: NativeFont) -> Self {
        self.applying(.font, value: font)
    }
    
    
    /// Adds a shadow to this text
    func shadow(_ shadow: NSShadow) -> Self {
        self.applying(.shadow, value:shadow)
    }
}



public extension NSAttributedString {
    
    var wholeRange: NSRange {
        NSRange(location: 0, length: length)
    }
    
    
    func applying(_ key: NSAttributedString.Key, value: Any) -> Self {
        let mutable = self.mutable()
        mutable.addAttribute(key, value: value, range: wholeRange)
        return Self.init(attributedString: mutable)
    }
    
    
    func applying(_ attributes: [NSAttributedString.Key:Any]) -> Self {
        let mutable = self.mutable()
        mutable.addAttributes(attributes, range: wholeRange)
        return Self.init(attributedString: mutable)
    }
    
    
    @available(*, deprecated, renamed: "applying(_:)")
    @inline(__always)
    func apply(_ attributes: [NSAttributedString.Key : Any]) -> NSAttributedString { applying(attributes) }
    
    
    func mutable() -> NSMutableAttributedString {
        if let mutable = self as? NSMutableAttributedString {
            return mutable
        }
        else if let mutable = self.mutableCopy() as? NSMutableAttributedString {
            return mutable
        }
        else {
            return NSMutableAttributedString(attributedString: self)
        }
    }
}
