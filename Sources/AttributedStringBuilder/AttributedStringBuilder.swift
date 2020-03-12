import Foundation

@_functionBuilder
public struct AttributedStringBuilder {
    public static func buildBlock(_ segments: AttributedStringConvertible...) -> NSAttributedString {
        let string = NSMutableAttributedString()
        segments.forEach { string.append($0.attributed) }
        return string
    }
    
    
    public static func buildIf(_ segment: AttributedStringConvertible?) -> NSAttributedString {
        segment?.attributed ?? NSAttributedString()
    }
}



public extension NSAttributedString {
    convenience init(@AttributedStringBuilder _ content: () -> NSAttributedString) {
        self.init(attributedString: content())
    }
}
