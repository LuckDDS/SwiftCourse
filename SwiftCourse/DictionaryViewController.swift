//
//  DictionaryViewController.swift
//  SwiftCourse
//
//  Created by 董德帅 on 2020/7/8.
//  Copyright © 2020 九天. All rights reserved.
//

import UIKit

class DictionaryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        dictionaryUse();
        // Do any additional setup after loading the view.
    }
    /// 字典使用
    func dictionaryUse() {
        
        //注意⚠️字典是无序的
        //初始化字典,下面这几个没有用到所以直接用_代替名字了,不然报黄太恶心了
        let _ = [Int:String]();
        
        let _:[Int:String];
 
        let _:[Int:String] = [:];
        
        let _:Dictionary<Int,String> = [:];
        
        let _ = ["1":"1"];
        
        //基本也就是上面的这几种形式了,会一种就够了
        
        //实操
        let dicTemp:Dictionary<String,String> = ["1":"赵","2":"钱","3":"孙","4":"李","5":"周"];
        
        var dic:[String:String];
        //给字典赋值
        dic = dicTemp;
        
        //获取所有的key
        let keys = dic.keys;
        //获取所有的value
        let values = dic.values;
        
        //注意⚠️⚠️⚠️⚠️⚠️⚠️字典是无序的,所以下面所有使用下标法的直接注释了
        //设置值,使用的是下标法,也就是根据key
//        dic[keys.first ?? "1"] = "王";
        
//        dic[keys[keys.index(keys.startIndex, offsetBy: 2)]] = "吴";
        
        dic["3"] = "任";
        
        //没有key就会添加新的键值对
        dic.updateValue("张", forKey: "11");
        dic["6"] = "轩";
        
        //注意⚠️字典是无序的
        //根据key获取值
//        let first = dic[keys.first ?? "1"];
        
//        let second = dic[keys[keys.index(after: keys.startIndex)]];
        
//        let last = dic[keys[keys.index(keys.endIndex, offsetBy: -1)]];
        
        let other = dic["4"];
        
        //删除两种方式,第一种直接赋值nil,第二种remove,个人更倾向于remove
        //下面的几种删除都有返回值,删除成功会返回对应的内容,否则返回nil
        //根据下标
//        dic.remove(at: dic.index(after: dic.startIndex));
        //根据key
        dic.removeValue(forKey: "5");
        //设置nil
        dic["3"] = nil;
        
        //遍历
        for item in dic {
            print("\(item.key):\(item.value)");
        }
        for (key,value) in dic {
            print(key+":"+value);
        }
        
        //删除所有
        dic.removeAll();
        
        //删除所有但保留dic的容量
        dic.removeAll(keepingCapacity: true);
        
        
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
