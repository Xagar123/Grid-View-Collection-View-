//
//  LanguageViewController.swift
//  grid view
//
//  Created by Admin on 04/12/22.
//

import UIKit

class LanguageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "cancle", style: .done, target: self, action: #selector(cancleButton))
    }
    

    @objc func cancleButton(){
        dismiss(animated: true,completion: nil)
    }

}
