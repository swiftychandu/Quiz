//
//  tabBarController.swift
//  Quiz
//
//  Created by chandrasekhar yadavally on 5/6/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [setUpTabBar()]
    }
    
    func setUpTabBar() -> UINavigationController {
        let nc = UINavigationController(rootViewController: QuizViewController())
        nc.tabBarItem = UITabBarItem(title: "Quiz", image: UIImage(systemName: "questionmark.diamond"), tag: 0)
        return nc
    }
    
  
}
