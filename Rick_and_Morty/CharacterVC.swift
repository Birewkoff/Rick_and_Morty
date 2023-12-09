//
//  CharacterVC.swift
//  Rick_and_Morty
//
//  Created by Arthur on 09.12.2023.
//

import UIKit

class CharacterVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        // MARK: - текс и картинка для перехода
        let backText = "GO BACK"
        let arrowImage = UIImage(named: "Arrow.png")
        
        let backButton = UIButton(type: .system)
        backButton.frame = CGRect(x: 0, y: 0, width: 120, height: 44)
        backButton.tintColor = .black
        backButton.setTitle(backText, for: .normal)
        backButton.setImage(arrowImage, for: .normal)
        backButton.semanticContentAttribute = .forceLeftToRight // Гарантируем, что изображение слева

        // MARK: - второе изображение
        let otherImage = UIImage(named: "logo-black2.png")
        let otherImageView = UIImageView(image: otherImage)
        otherImageView.contentMode = .scaleAspectFit
        otherImageView.tintColor = .black

        // MARK: - стек кнопки и изображения
        let stackView = UIStackView(arrangedSubviews: [backButton, otherImageView])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 220

        // MARK: - действие обработки данных назад
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)

        // настройка вида кнопки
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: stackView)
    }
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

}
