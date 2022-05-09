//
//  UiViewController+Utils.swift
//  Bankey
//
//  Created by sergio shaon on 9/5/22.
//

import UIKit

extension UIViewController{
    
    func setStatusBar(){
        let statusBarSize = UIApplication.shared.statusBarFrame.size
        let frame = CGRect(origin: .zero, size: statusBarSize)
        let statusBarView = UIView(frame: frame)
        statusBarView.backgroundColor = .red
        view.addSubview(statusBarView)
    }
    
    func tabBarImage(imageName: String, title: String){
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}
