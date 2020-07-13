//
//  MianTestViewController.swift
//  SwiftCourse
//
//  Created by 董德帅 on 2020/7/13.
//  Copyright © 2020 九天. All rights reserved.
//

import UIKit

class MianTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        //定义一个BlockController
        let blockController: BlockViewController = BlockViewController();
        self.navigationController?.pushViewController(blockController, animated: true);
        blockController.view.backgroundColor = UIColor.yellow;
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
