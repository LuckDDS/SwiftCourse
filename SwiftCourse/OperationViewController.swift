//
//  OperationViewController.swift
//  SwiftCourse
//
//  Created by 董德帅 on 2020/7/6.
//  Copyright © 2020 九天. All rights reserved.
//

import UIKit

class OperationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    /// 赋值运算符
    func valuationFunc() {
        
        let a = 12;
        let b = a;
        //这个时候b等于a
        
        //元组也是如此,举例如下
        let (c,d) = (12,34);
        //c=12,d=34;
        
        //有一点需要注意就是赋值运算符没有返回值,举例如下,代码会报错的,因为 a=b没有任何返回值,这个时候需要使用 a==b
//        if a = b {
//
//        }
        if a == b {
            
        }
        
        var e: Int;
        var f = 12;
        f += 3;
        //结果是f = 15
        
        //下面的写法是错误的,原因是+=符号只是给f赋值,但是整个操作没有返回值的即(f+=3)没有返回值
        //e = f+=3;
        
        
    }
    
    func circulation()  {
        
        let name = ["赵","钱","孙","李","周","吴","郑","王"];
    
        //遍历范围1-5
        for index in 1...5 {
            print(index);
            //打印结果1,2,3,4,5
        }
        //遍历范围1-4
        for index in 1..<5 {
            print(index);
            //打印结果1,2,3,4
        }
        //遍历范围0-3
        for index in [...3] {
            print(name[index]);
            //打印结果:赵钱孙李
        }
        //遍历范围5-(name.count-1)
        for index in [5...] {
            print(name[index]);
            //打印结果:吴郑王
        }
        //遍历范围0-(name.count-1)
        for index in [..<name.count] {
            print(name[index]);
            //打印结果:赵钱孙李周吴郑王
        }
        //遍历范围4-(name.count-1)
        for index in [4..<name.count] {
            print(name[index]);
            //打印结果:周吴郑王
        }
                
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
