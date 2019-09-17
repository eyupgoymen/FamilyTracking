//
//  HomePageViewController.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 4.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import UIKit

final class HomePageViewController: BaseViewController, Alertable, Loadable {
    //variables
    var viewModel: HomePageViewModelProtocol! {
        didSet {
            guard let viewModel = viewModel else { return }
            viewModel.delegate = self
        }
    }
    
    //Views
    let titleLabel           = Label(style: .bannerTitle)
    let backgroundImageView  = ImageView(style: .normal(contentMode: .scaleAspectFill, image: Images.Background.homeBackground))
    let blackTransperentView = View(style: .darkTransparent)
    let familyTextField      = EKGTextField(placeholder: "Family Id")

    let joinButton           = Button(style: .yellow)
    let createFamilyButton   = Button(style: .dark(title: "Create Family"))
    let getMemberIdButton    = Button(style: .dark(title: "Get Member Id"))
    let orLabel              = Label(style: .placeholder(title: "or", color: .white))

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setTargets()
    }
    
    private func setTargets() {
        createFamilyButton.addTarget(self, action: #selector(handleCreateFamily), for: .touchUpInside)
        getMemberIdButton.addTarget(self, action: #selector(handleGetMemberId), for: .touchUpInside)
        joinButton.addTarget(self, action: #selector(handleJoinFamily), for: .touchUpInside)
    }
}

//Handle actions
extension HomePageViewController {
    @objc func handleGetMemberId() {
        viewModel.getMemberId()
    }
    
    @objc func handleCreateFamily() {
        viewModel.createFamily()
    }
    
    @objc func handleJoinFamily() {
        viewModel.joinFamily(familyId: familyTextField.text ?? "")
    }
}

extension HomePageViewController: HomePageViewModelDelegate {
    func handleViewModelOutPut(_ output: HomePageViewModelOutput) {
        switch output {
            case .showLoader(let status):
                status == true ? showLoader(type: .map) : dismissLoader()
            
            case .showError(let error):
                showAlert(title: "Error", message: error.localizedLowercase)
            
            case .familyCreated(let familyId):
                showPopup(type: .familyCreated(familyId: familyId))
            
            case .joinedFamily:
                viewModel.navigateToMapPage()
            
            case .gotMemberId(let memberId):
                showPopup(type: .memberIdCreated(memberId: memberId))
        }
    }

    func handleRoute(_ route: HomePageRoute) {
        switch route {
            case .routeToMapPage(let familyId, let memberId):
                self.navigationController?.pushViewController(MapPageBuilder.make(familyId: familyId, memberId: memberId), animated: true)
        }
    }
}

extension HomePageViewController: Popupable {
    func donePressed(type: PopupType) {
        switch type {
            case .familyCreated(_): // navigate for only when family created
                viewModel.navigateToMapPage()
            
            default:
                print("Nothing")
        }
    }
}
