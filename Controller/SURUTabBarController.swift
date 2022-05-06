//
//  SURUTabBarController.swift
//  SURU_Leo
//
//  Created by LEO W on 2022/4/16.
//

import UIKit
import FirebaseAuth


private struct StoryboardCategory {
    static let waterfalls = "CommentWallViewController"

    static let mapping = "MappingViewController"
    
    static let comment = "CommentViewController"

    static let profile = "ProfileViewController"
}

private enum Tab {
    case waterfalls

    case mapping

    case comment
    
    case profile

    func controller() -> UIViewController {
        var controller: UIViewController
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        switch self {
        case .waterfalls: controller = storyboard.instantiateViewController(withIdentifier: StoryboardCategory.waterfalls)

        case .mapping: controller = storyboard.instantiateViewController(withIdentifier: StoryboardCategory.mapping)
            
        case .comment: controller = storyboard.instantiateViewController(withIdentifier: StoryboardCategory.comment)
            
        case .profile: controller = storyboard.instantiateViewController(withIdentifier: StoryboardCategory.profile)
        }

        controller.tabBarItem = tabBarItem()
        controller.tabBarItem.imageInsets = UIEdgeInsets(top: 6.0, left: 0.0, bottom: -6.0, right: 0.0)
        return controller
    }

    func tabBarItem() -> UITabBarItem {
        switch self {
        case .waterfalls:
            return UITabBarItem(
                title: "探索",
                image: UIImage.asset(.Icons_24px_Address),
                selectedImage: UIImage.asset(.Icons_24px_Address)
            )

        case .mapping:
            return UITabBarItem(
                title: "地圖",
                image: UIImage.asset(.Icons_24px_CollectionView),
                selectedImage: UIImage.asset(.Icons_24px_CollectionView)
            )

        case .comment:
            return UITabBarItem(
                title: "發表評論",
                image: UIImage.asset(.Icons_24px_RegisterCellphone),
                selectedImage: UIImage.asset(.Icons_24px_RegisterCellphone)
            )

        case .profile:
            return UITabBarItem(
                title: "個人資料",
                image: UIImage.asset(.Icons_36px_Profile_Selected),
                selectedImage: UIImage.asset(.Icons_36px_Profile_Selected)
            )
        }
    }
}

class SURUTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    private let tabs: [Tab] = [.mapping, .waterfalls, .comment, .profile]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewControllers = tabs.map({ $0.controller() })
        delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBar.backgroundColor = .white
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let userID = UserRequestProvider.shared.currentUserID {
            print("Login success, id: \(userID)")
        }else {
            presentWelcomePage()
        }
    }

    func presentWelcomePage() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "WelcomeViewController")
        self.present(controller, animated: true, completion: nil)
    }
    func tabBarController(
        _ tabBarController: UITabBarController,
        shouldSelect viewController: UIViewController
    ) -> Bool {
        true
    }
}
