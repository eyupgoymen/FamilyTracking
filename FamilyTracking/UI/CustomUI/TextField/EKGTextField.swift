//
//  HomePageViewController.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 4.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import UIKit
import SnapKit

final class EKGTextField: UITextField {

    private var placeholderLabel = Label(style: .placeholder(title: "Family Id", color: Colors.darkButtonColor))
    let padding = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
    
    var placeholderAnimatedColor = UIColor.white

    convenience init(placeholder: String,
                     placeholderAnimatedColor: UIColor = .white,
                     defaultPlaceholderColor: UIColor = Colors.darkButtonColor,
                     backgroundColor: UIColor = .white) {
        self.init()
        placeholderLabel.setProps(.text(placeholder),
                                  .color(defaultPlaceholderColor))
        self.backgroundColor = backgroundColor
        self.placeholderAnimatedColor = placeholderAnimatedColor
        setupView()
        setConstraints()
        delegate = self
    }

    ///Set set custom attributes
    private func setupView() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 8
        self.textColor = Colors.darkGrayColor
    }

    ///Set textfields constraints
    private func setConstraints() {
        self.addSubview(placeholderLabel)
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false

        placeholderLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(12)
            make.centerY.equalToSuperview()
        }
    }

    ///Override methods for padding
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}

extension EKGTextField: UITextFieldDelegate {

    ///if the textfield empty move placeholder up
    func textFieldDidBeginEditing(_ textField: UITextField) {
        guard textField.text == "" else { return }
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 1,
                       options: [.curveEaseInOut], animations: {
            self.placeholderLabel.transform = CGAffineTransform(translationX: -9, y: -36) // move up
            self.placeholderLabel.textColor = self.placeholderAnimatedColor
        })
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        guard textField.text == "" else { return }
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 1,
                       options: [.curveEaseInOut], animations: {
            self.placeholderLabel.transform = .identity
            self.placeholderLabel.textColor = Colors.darkButtonColor
        })
    }
}
