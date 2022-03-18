//
//  FeedViewController.swift
//  Navigation
//
//  Created by Александр Смирнов on 25.02.2022.
//

import UIKit

class FeedViewController: UIViewController {

    let myPost = Post(title: "Новый заголовок!")
    
    private lazy var transitionButton: UIButton = {
        let button = UIButton()
        
        button.clipsToBounds = true
        button.backgroundColor = .systemBlue
        button.setTitle("Перейти на другой экран", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapTransitionButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 12
        //настройка тени под кнопкой с помощью слоя CALayer
        button.layer.masksToBounds = false
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        button.layer.shadowRadius = 4.0
        button.layer.shadowOpacity = 0.7
        //==================================================
        
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(self.transitionButton)
        self.activateConstraints()
    }
    
    private func activateConstraints() {
        self.transitionButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
        self.transitionButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        self.transitionButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        self.transitionButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc private func didTapTransitionButton() {
        let pvc = PostViewController()
        pvc.title = myPost.title
        self.navigationController?.pushViewController(pvc, animated: true)
    }    
}

