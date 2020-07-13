//
//  ArrayViewController.swift
//  SwiftCourse
//
//  Created by 董德帅 on 2020/7/7.
//  Copyright © 2020 九天. All rights reserved.
//

import UIKit

class ArrayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        arrayInit();
//        arrFunc();
        arrOtherFunc();
        // Do any additional setup after loading the view.
    }
    
    /// 数组初始化
    func arrayInit() {
        //下面是存储的Int类型的数组,其他的类型不能放进去
        var arr = [Int]();
        
        //之前已经确认了arr存储的数据类型,所以可以像下面这种创建一个空数组,将arr清空
        arr = [];
        
        //不确定存储类型时使用any,这个时候可以添加任意类型的内容
        var arr1 = [Any]();
        
        //直接声明数组
        let arr2 = [1,3,5];
        
        //只能存储字符串
        let arr3:[String] = [];
        
        //初始化时赋值
        let arr4:[String] = ["2"];
        
        //初始化带有默认值的数组,arr5中有20个元素都为0
        let arr5 = Array(repeating: 0, count: 20);
        
        //通过其他的数组初始化,将arr4的内容添加到arr6中,修改arr6不影响arr4
        var arr6 = Array(arr4);
        arr6.append("32");
        
    }
    
    /// array的增删改查
    func arrFunc() {
        
        let arrStrTemp: [String] = ["10","12","13","14","15","16","17","18","19","20","21","22","23","24"]
        
        
        var arrStr: [String] = ["1"];
        
        //像尾部添加单个元素
        arrStr.append("2");
        
        //将整个数组拼接到后面
        arrStr.append(contentsOf: arrStrTemp);
        
        //增加元素
        arrStr += ["234","123"];
        
        //插入单个元素指定位置
        arrStr.insert("3", at: 2);
        
        //将数组插入数组
        arrStr.insert(contentsOf: arrStrTemp, at: 4);
        
        //还有一种步进增加,目前只试了字符串不行,数值可以
        //从30开始步进为5,到60停止
        var arrInt: [Int] = [1];
        arrInt.append(contentsOf: stride(from: 30, to: 60, by: 5));
        
        
        //删除指定坐标的元素,并会返回删除的这个元素
        var removeStr = arrStr.remove(at: 0);
        
        //删除最后的元素,并会返回删除的这个元素
        var removeStrLast = arrStr.removeLast();
        
        //删除第一个元素,并会返回删除的这个元素
        var removeStrFirst = arrStr.removeFirst();
        
        //删除从开始数前三个元素
        arrStr.removeFirst(3);
        
        //删除从末尾开始数倒数两个元素
        arrStr.removeLast(2);
        
        //删除指定范围的元素
        arrStr.removeSubrange(0...2);
        
        let range = Range.init(0...3);//0..<4
        let range1 = Range.init(NSMakeRange(0, 3));//0..<3
        arrStr.removeSubrange(range);
        if let r = range1 {
            arrStr.removeSubrange(r);
        }
        
        //清空数组
        arrStr.removeAll();
        
        //清空数组,但是保留数组现有的容量,默认为false
        arrStr.removeAll(keepingCapacity: true)
        
        //前面删光了,得添加一点
        arrStr.append(contentsOf: arrStrTemp);
        
        //改元素,最直接的
        arrStr[1] = "00";
        
        //范围替换,替换的数量可以更多,相当于变相的增加
        arrStr.replaceSubrange(0..<3, with: ["22","33","44","99"]);
        
        
        //查询某个坐标下的元素,
        let strTwo = arrStr[2];
        
        //查询0-3之间的元素,返回一个数组
        let strT = arrStr[0...3];
        
        //查询arrStr前三位之后的元素
        let strArr1 = arrStr.suffix(from: 3);
        
        //查询arrStr前面三个元素
        let strArr2 = arrStr.prefix(upTo: 3);
        
        
    }
    
    /// 数组的其他用法
    func arrOtherFunc() {
        
        var arrOne: [String] = ["1","2","3","4","5","6","7"];
        var arrTwo: [String] = ["11","22","33","44","55","66","77"];
        
        //两个数组生成一个数组,真简单
        var arrAll = arrOne+arrTwo;
        
        //获取数组数量
        var count = arrAll.count;
        //还有一个属性capacity容量,这个属性和count不一样
        //count指的是数组中具体包含的元素个数,capacity指的是数组可以容纳的元素个数,一般是capacity>=count
        var capacity = arrAll.capacity;
        
        //判断数组是否空
        if arrAll.isEmpty {
            
        }
        
        //数组遍历,顺序遍历
        for item in arrAll {
            print(item);
        }
        
        //枚举器遍历,也是顺序遍历,可以获取下标
        for (index,value) in arrAll.enumerated() {
            print(String(index) + ":" + value);
        }
        
        //数组添加进集合,没发现好的方法,目前只能遍历添加,有好的方法请告知谢谢
        var setStr: Set<String> = [];
        for item in arrAll {
            setStr.insert(item);
        }
        
        //数组转字符串
        let str = arrAll.joined();
        //通过-将元素链接
        let str1 = arrAll.joined(separator: "-");
        
        //字符串转数组
        let newArr = str1.components(separatedBy: "-");
        
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
