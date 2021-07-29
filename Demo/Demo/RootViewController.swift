//
//  RootViewController.swift
//  Demo
//
//  Created by Toni Kocjan on 29/07/2021.
//

import UIKit

class RootViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .red
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    navigationController?.pushViewController(FormsListViewController(
      validationForms: [
        ("Login", LoginValidationForm()),
        ("Sign up", SignUpValidationForm()),
      ]
    ), animated: true)
  }
}
