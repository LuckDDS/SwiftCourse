//
//  SetViewController.swift
//  SwiftCourse
//
//  Created by 董德帅 on 2020/7/8.
//  Copyright © 2020 九天. All rights reserved.
//

import UIKit

class SetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setInit();
        setFunc();
        setOtherFunc();
        // Do any additional setup after loading the view.
    }
    /// 初始化Set
    func setInit() {
        
        //创建存储字符的集合
        let charSet = Set<Character>();
        
        //创建存储字符串的集合
        let strSet = Set<String>();
        
        //创建存储Int类型的集合
        let intSet = Set<Int>();
        
        //使用数组的方式创建集合
        let arrSet: Set = ["1","2"];
        
        //只是定义了没有初始化,不能使用
        let arrSet1: Set<String>;
        //初始化
        arrSet1 = [];
        
        //基本上跟java十分类似了
        
    }
    
    /// 集合的增删
    func setFunc() {
        
        var strSet: Set<String> = [];
        let strSetTemp: Set = ["1","2","3","4"];
        
        //集合增加元素,因为集合没有顺序,也就没有下标的概念,所以下面的所有操作没有index的概念
        strSet.insert("5");
        strSet.insert("1");

        //strSet删除元素,返回删除的元素,如果没有会返回nil
        var removeStr = strSet.remove("1");
        
        //删除第一个
        strSet.removeFirst();
        
        //删除全部
        strSet.removeAll();
                
        //查找集合中是否有某个元素
        let contain: Bool = strSet.contains("1");
        
    }
    /// 集合其他相关操作
    func setOtherFunc() {
        
        var setStr: Set<String> = ["1","2","3","4","5","6","7","8","11","55"];
        var setStrTemp: Set<String> = ["11","22","33","44","55","66","3","4"];
        
        //判断集合中是否有"1",有的话返回,没有的话添加进去.
        let s = setStr.update(with: "1");
        
        //遍历集合,无序
        for item in setStr {
            print(item);
        }
        //遍历集合通过sorted函数进行排序遍历
        for item in setStr.sorted() {
            print(item);
        }
        
        //求集合交集
        let intersectionSet = setStr.intersection(setStrTemp);
        
        //去除两者都包含的内容,返回新的集合
        let symmetricDifferenceSet = setStr.symmetricDifference(setStrTemp);
        
        //求合集
        let unionSet = setStr.union(setStrTemp);
        
        //删除调用的集合中两者共有的元素生成新的集合
        let subtractingSet = setStr.subtracting(setStrTemp);
        //以上的几个方法都生成新的集合
        
        //排序后转数组
        let arr: [String] = subtractingSet.sorted();
        print(arr);
        
        //还有是否属于子集合,父集合什么的不写了,很简单
        
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
