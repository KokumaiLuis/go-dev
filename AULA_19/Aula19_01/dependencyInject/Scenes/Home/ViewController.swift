//
//  ViewController.swift
//  dependencyInject
//
//  Created by Douglas Nunes on 30/03/22.
//

import UIKit

class ViewController: UIViewController {

	let api = ServiceAPI()
	
//	private let apiUser: ServiceAPI?
//
//	init(apiUser: ServiceAPI) {
//		self.apiUser = apiUser
//		super.init(nibName: nil, bundle: nil)
//	}
	
	private let apiServiceProtocol: ServiceAPIProtocol?
	
	init(apiServiceProtocol: ServiceAPIProtocol) {
		self.apiServiceProtocol = apiServiceProtocol
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .orange
		
		apiServiceProtocol?.getUsers(completion: { result in
			switch result {
				
			case .success(let users):
				print("Users: \(users)")
			case .failure(_):
				print("Error")
			}
		})
		
//		api.getUsers { result in
//			switch result {
//
//			case .success(let users):
//			print("users: \(users)")
//			case .failure(let error):
//				print("Error: \(error.localizedDescription)")
//			}
//		}
		
//		apiUser?.getUsers(completion: { result in
//			switch result {
//			case .success(let users):
//				print("Users: \(users)")
//			case .failure(_):
//				print("Error")
//			}
//		})
		
		
	}


}

