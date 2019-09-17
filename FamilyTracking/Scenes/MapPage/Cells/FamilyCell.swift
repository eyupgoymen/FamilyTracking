//
//  FamilyCell.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 6.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import UIKit

class FamilyCell: UICollectionViewCell {

    let familyMemberIcon    = ImageView(style: .rounded(20))
    var isAddCell = false {
        didSet {
            familyMemberIcon.set(props: .image(isAddCell == true ? Images.Icon.add : Images.Family.family_member))
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }

    func setLayout() {
        setSubViews()
        setConstraints()

    }

    ///Add subviews
    private func setSubViews() {
        add(familyMemberIcon)
    }

    ///Set constraint for subviews
    private func setConstraints() {
        familyMemberIcon.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
