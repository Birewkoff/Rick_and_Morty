//
//  EpisodesViewController.swift
//  Rick_and_Morty
//
//  Created by Arthur on 04.12.2023.
//

import UIKit

class EpisodesViewController: UIViewController {
    
    // MARK: - image Logo
    var imageLabel = UIImageView()
    let image = UIImage(named: "Label.jpg")
    // MARK: - search controller
//    let searchController = UISearchController(searchResultsController: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        //MARK: - image Logo properties
        let parentWidth = view.bounds.width
        let xCoordinate = (parentWidth - 200) / 2
        self.imageLabel.frame = CGRect(x: xCoordinate, y: 30, width: 200, height: 200)
        self.imageLabel.contentMode = .scaleAspectFit
        self.imageLabel.image = self.image
        self.view.addSubview(self.imageLabel)
        
        // MARK: - вызов func search
//        setupSearchController()
        
        // MARK: - замыкание для кнопки
        
        
        // MARK: - квадрат
        // Создаем пустое изображение с использованием UIGraphicsImageRenderer
        let screenSize = UIScreen.main.bounds.size
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: screenSize.width, height: screenSize.height))
        let whiteSquareImage = renderer.image { context in
        // Рисуем белый квадрат
        let squareWidth: CGFloat = 300
        let squareHeight: CGFloat = 300

        let x = (screenSize.width - squareWidth) / 2
        let squareRect = CGRect(x: x, y: 200, width: squareWidth, height: squareHeight)
        context.cgContext.setFillColor(UIColor.white.cgColor)
        context.cgContext.fill(squareRect)

            // Добавляем внешнюю тень к квадрату
            let outerShadowPath = UIBezierPath(rect: squareRect)
            let shadowColor = UIColor.black.withAlphaComponent(0.1)
            // Тень слева
            context.cgContext.setShadow(offset: CGSize(width: -5, height: 0), blur: 5.0, color: shadowColor.cgColor)
            context.cgContext.addPath(outerShadowPath.cgPath)
            context.cgContext.fillPath()
            
            // Тень справа
            context.cgContext.setShadow(offset: CGSize(width: 5, height: 0), blur: 5.0, color: shadowColor.cgColor)
            context.cgContext.addPath(outerShadowPath.cgPath)
            context.cgContext.fillPath()

            // Тень сверху
            context.cgContext.setShadow(offset: CGSize(width: 0, height: -1), blur: 5.0, color: shadowColor.cgColor)
            context.cgContext.addPath(outerShadowPath.cgPath)
            context.cgContext.fillPath()

            // Тень снизу
            context.cgContext.setShadow(offset: CGSize(width: 0, height: 5), blur: 5.0, color: shadowColor.cgColor)
            context.cgContext.addPath(outerShadowPath.cgPath)
            context.cgContext.fillPath()
                        
                // Вкладываем картинку во внутырь квадрата
                let imageWidth: CGFloat = 300
                let imageHeight: CGFloat = 200

                let imageX = squareRect.midX - (imageWidth / 2)
                let imageY = squareRect.origin.y

                let imageRect = CGRect(x: imageX, y: imageY, width: imageWidth, height: imageHeight)
                // Обрезаем context
                context.cgContext.clip(to: squareRect)
                // Отключаем тень перед рисованием изображения
                context.cgContext.setShadow(offset: CGSize(width: 0, height: 0), blur: 0, color: nil)

                let image = UIImage(named: "Media.jpg")
                image?.draw(in: imageRect)
                // Включаем тень после рисования изображения
                context.cgContext.setShadow(offset: CGSize(width: 0, height: 5), blur: 5.0, color: shadowColor.cgColor)
                    
                    
                    // Добавляем заголовок
                    let title = "Rick Sanchez"
                    let titleFont = UIFont(name: "Roboto-Regular", size: 20) ?? UIFont.systemFont(ofSize: 20)

                    let titleAttributes: [NSAttributedString.Key: Any] = [
                        .font: titleFont,
                        .foregroundColor: UIColor.black
                    ]
                    let titleSize = title.size(withAttributes: titleAttributes)

                    let titleX = squareRect.origin.x + 10
                    let titleY = imageRect.maxY + 15

                    let titleRect = CGRect(x: titleX, y: titleY, width: titleSize.width, height: titleSize.height)

                    title.draw(in: titleRect, withAttributes: titleAttributes)
                    
                    // Наложение нижней области, закругление краев и установка цвета
                    let grayAreaHeight: CGFloat = 50
                    let grayAreaRect = CGRect(x: squareRect.origin.x, y: squareRect.maxY - grayAreaHeight, width: squareRect.width, height: grayAreaHeight)

                    let radius: CGFloat = 10  // Радиус закругления
                    let grayAreaPath = UIBezierPath(roundedRect: grayAreaRect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: radius, height: radius))

                    let grayAreaColor = UIColor(red: 0.950, green: 0.950, blue: 0.950, alpha: 1.0) // Цвет #F9F9F9

                    context.cgContext.setFillColor(grayAreaColor.cgColor)
                    context.cgContext.addPath(grayAreaPath.cgPath)
                    context.cgContext.fillPath()
                    
                    // Добавляем маленькое изображение
                    let smallImageWidth: CGFloat = 30
                    let smallImageHeight: CGFloat = 30
                    let smallImageX = grayAreaRect.origin.x + 10
                    let smallImageY = grayAreaRect.midY - (smallImageHeight / 2)
                    let smallImageRect = CGRect(x: smallImageX, y: smallImageY, width: smallImageWidth, height: smallImageHeight)

                    let smallImage = UIImage(named: "Play.png")
                    smallImage?.draw(in: smallImageRect)
                    
                    // Добавляем заголовок
                    let titleEpisode = "Pilot | S01E01"
                    let titleFontEpisode = UIFont(name: "Roboto-Regular", size: 16) ?? UIFont.systemFont(ofSize: 16)
                    let titleAttributesEpisode: [NSAttributedString.Key: Any] = [
                        .font: titleFontEpisode,
                        .foregroundColor: UIColor.black
                    ]
                    let titleSizeEpisode = titleEpisode.size(withAttributes: titleAttributesEpisode)

                    // Отступ между изображением и заголовком
                    let titleImageSpacing: CGFloat = 10

                    // Координаты для заголовка
                    let titleEpisodeX = smallImageRect.maxX + titleImageSpacing
                    let titleEpisodeY = smallImageRect.midY - (titleSizeEpisode.height / 2)
                    let titleRectEpisode = CGRect(x: titleEpisodeX, y: titleEpisodeY, width: titleSizeEpisode.width, height: titleSizeEpisode.height)

                    titleEpisode.draw(in: titleRectEpisode, withAttributes: titleAttributesEpisode)


                    // Добавляем кнопку в виде сердца
                    let heartButtonWidth: CGFloat = 30
                    let heartButtonHeight: CGFloat = 30
                    let heartButtonX = grayAreaRect.maxX - heartButtonWidth - 10
                    let heartButtonY = grayAreaRect.midY - (heartButtonHeight / 2)
                    let heartButtonRect = CGRect(x: heartButtonX, y: heartButtonY, width: heartButtonWidth, height: heartButtonHeight)

                    let heartButtonImage = UIImage(systemName: "heart")
                    heartButtonImage?.draw(in: heartButtonRect)

                }
        
        // Отображение
        let imageView = UIImageView(image: whiteSquareImage)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true // Включаем пользовательские взаимодействия для изображения

        // нажатие
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        imageView.addGestureRecognizer(tapGestureRecognizer)
        view.addSubview(imageView)

        // Настройка Constraints
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
    
    @objc func imageTapped() {
            let destinationViewController = CharacterVC()
            navigationController?.pushViewController(destinationViewController, animated: true)
        }
    
//    @objc func imageTapped() {
//        performSegue(withIdentifier: "Character", sender: self)
//    }
    
    // MARK: - func search
//    func setupSearchController() {
//        self.searchController.searchResultsUpdater = self
//        self.searchController.obscuresBackgroundDuringPresentation = false
//        self.searchController.hidesNavigationBarDuringPresentation = false
//        self.searchController.searchBar.placeholder = "Name or episode"
//
//        self.navigationItem.searchController = searchController
//        self.definesPresentationContext = true
//        self.navigationItem.hidesSearchBarWhenScrolling = false
        
    }

