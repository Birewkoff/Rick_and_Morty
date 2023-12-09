//
//  TabBarViewController.swift
//  Rick_and_Morty
//
//  Created by Arthur on 05.12.2023.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
    }
    private func generateTabBar() {
            let episodesViewController = UINavigationController(rootViewController: EpisodesViewController())
            episodesViewController.tabBarItem.title = "Home"
            episodesViewController.tabBarItem.image = UIImage(systemName: "house.fill")
            
            let favouritesViewController = UINavigationController(rootViewController: FavouritesViewController())
            favouritesViewController.tabBarItem.title = "Likes"
            favouritesViewController.tabBarItem.image = UIImage(systemName: "heart.fill")

            viewControllers = [episodesViewController, favouritesViewController]
        }
//    private func generateTabBar() {
//        viewControllers = [
//            generateVC(viewController: EpisodesViewController(), title: "Home", image: UIImage(systemName: "house.fill")),
//            generateVC(viewController: FavouritesViewController(), title: "Likes", image: UIImage(systemName: "heart.fill"))
//        ]
//    }
//
//    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
//        viewController.tabBarItem.title = title
//        viewController.tabBarItem.image = image
//        return viewController
    }
