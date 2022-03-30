//
//  Aula18_01Button.swift
//  Aula18_01
//
//  Created by SP11793 on 29/03/22.
//

import UIKit

public class Aula18_01Button: UIButton {
    
    private var config: Config {
        didSet {
            updateDisplay()
        }
    }
    
    
    public init(config: Config) {
        self.config = config
        super.init(frame: .zero)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        config = .light()
        super.init(coder: coder)
        configure()
    }
    
    public override var intrinsicContentSize: CGSize {
        CGSize(width: 140, height: 40)
    }
    
    public override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.1, delay: 0, options: [.beginFromCurrentState, .curveEaseOut]) { [self] in
                self.backgroundColor = self.isHighlighted ? self.config.highlightedBackgroundColor : self.config.backgroundColor
                
                self.applyShadow(shadow: self.isHighlighted ? .pressed() : .standard())
                
                self.transform = self.isHighlighted ? .init(translationX: 0, y: 1.5) : .identity
            } completion: { _ in
                
            }

        }
    }
    
    
    private func configure() {
        layer.cornerRadius = 6
        titleLabel?.font = UIFont.systemFont(ofSize: 14)
        translatesAutoresizingMaskIntoConstraints = false
        applyShadow(shadow: .standard())
        updateDisplay()
    }
    
    
    private func updateDisplay() {
        backgroundColor = config.backgroundColor
        setTitleColor(config.foregroundColor, for: .normal)
    }
    
    
    private func applyShadow(shadow: Shadow) {
        layer.shadowOffset = shadow.offset
        layer.shadowRadius = shadow.radius
        layer.shadowColor = shadow.color.cgColor
        layer.shadowOpacity = shadow.opacity
    }
    

}

public extension Aula18_01Button {
    
    struct Config {
        public let backgroundColor: UIColor
        public let highlightedBackgroundColor: UIColor
        public let foregroundColor: UIColor
        
        public static func light() -> Config {
            Config(backgroundColor: .white,
                   highlightedBackgroundColor: UIColor(red: 0.98, green: 0.98, blue: 1.00, alpha: 1.00),
                   foregroundColor: UIColor(red: 0.25, green: 0.27, blue: 0.38, alpha: 1.00))
        }
        
        public static func dark() -> Config {
            Config(backgroundColor: UIColor(red: 0.12, green: 0.13, blue: 0.21, alpha: 1.00),
                   highlightedBackgroundColor: UIColor(red: 0.09, green: 0.09, blue: 0.15, alpha: 1.00),
                   foregroundColor: UIColor(red: 0.98, green: 0.98, blue: 1.00, alpha: 1.00))
        }
    }
    
    struct Shadow {
        public let offset: CGSize
        public let radius: CGFloat
        public let color: UIColor
        public let opacity: Float
        
        static public func standard() -> Shadow {
            Shadow(offset: .init(width: 0, height: 2),
                   radius: 3,
                   color: UIColor(red: 0.00, green: 0.07, blue: 0.52, alpha: 1.00),
                   opacity: 0.02)
        }
        
        static public func pressed() -> Shadow {
            Shadow(offset: .init(width: 0, height: 1),
                   radius: 1,
                   color: UIColor(red: 0.00, green: 0.07, blue: 0.52, alpha: 1.00),
                   opacity: 0.02)
        }
    }
}
