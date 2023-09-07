//
//
//  Created by Eric Lin on 2023/1/11.
//  Copyright © 2019 Eric Lin. All rights reserved.
//

import UIKit

class CathayNavigationController: UINavigationController {
    override var navigationBar: UINavigationBar {
        let bar = super.navigationBar
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        appearance.backgroundColor = .white
        appearance.backButtonAppearance.normal.titlePositionAdjustment = UIOffset(horizontal: -1000, vertical: 0)
        bar.tintColor = .black
        bar.standardAppearance = appearance
        bar.scrollEdgeAppearance = appearance
        return bar
    }
    
    /**
     implementation of init(rootViewController:) will call self.init(nibName:bundle:)
     so we have to override init(nibName:bundle:) to prevent crash
     */
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
  
}
