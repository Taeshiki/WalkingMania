//
//  SurroundingWalkViewController.swift
//  WalkingMania
//
//  Created by 요시킴 on 2023/12/06.
//

import UIKit

class SurroundingWalkViewController: UIViewController {
    let textLabel : UILabel = {
            let text = UILabel()
            
            text.text = "주변 탐색 페이지"
            text.textColor = .systemBlue
            text.translatesAutoresizingMaskIntoConstraints = false
            
            return text
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
                self.view.addSubview(textLabel)
                textLabelAutoLayout()
    }

}

extension SurroundingWalkViewController {
    func textLabelAutoLayout() {
        NSLayoutConstraint.activate([
            self.textLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.textLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
    }
}
