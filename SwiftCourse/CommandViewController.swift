//
//  CommandViewController.swift
//  SwiftCourse
//
//  Created by 董德帅 on 2020/7/8.
//  Copyright © 2020 九天. All rights reserved.
//

import UIKit

class CommandViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        otherFunc();
        // Do any additional setup after loading the view.
    }
    /// forin循环
    func forIn() {
        
        //重复10次
        for _ in 1...10 {
            
        }
        
        //步进循环,间隔为5,从0-60,这个是开区间不算60
        for item in stride(from: 0, to: 60, by: 5) {
            print(item);
        }
        
        //步进循环,间隔为5,从0-60,这个是闭区间算60
        for item in stride(from: 0, through: 60, by: 5) {
            print(item);
        }
        
    }
    /// while循环
    func whileFunc() {
        
        //第一种先判断再执行
        var status = true;
        while status {
            print("true")
        }
        
        //第二种先执行再判断
        repeat{
            
            print("true");
            
        }while status;
        
    }
    /// switch语句
    func switchFunc() {
        
        //字符
        let char:Character = "z";
        
        switch char {
        case "a":
            print("a")
        case "z","Z":
            print("z")
        default:
            print("z")
        };
        
        //区间匹配
        let num = arc4random()%250;
        
        switch num {
        case 0:
            print("0");
        case 1..<50:
            print("1-50")
        case 50..<100:
            print("50-100")
        case 100..<150:
            print("150-200")
        case 150..<200:
            print("200-250")
        default:
            print("10")
        }
        
        //元组,遍历元组时注意元素内的数量和类型要对上
        let tuple = (1,"2");
        switch tuple {
        case (1,"3"):
            print("假")
        case (1,"2"):
            print("真")
        case (1,"1"):
            print("假")
        case (1,"4"):
            print("假")
        default:
            print("假")
        }
        
        //值绑定,这是神奇的东西,说实话第一次用
        //理解下来就是对比,case语句中已知的内容除了未知的就是下面的x,y,z,如果能和point对上那么就执行这个case
        let point = (1,3,2)//执行第一个case
//        let point = (1,3,3)//执行第二个case
//        let point = (1,3,4)//执行第三个case
//        let point = (4,5,7)//执行第五个case,这个case相当于是默认的
        switch point {
        case (let x,3,2):
            print(x);
        case (let x,3,let z):
                print(x);
        case (1,3,let z):
            print(z);
        case (1,let y,2):
            print(y);
        case (let x,let y,let z):
            print(x);
        }
        
        //使用where,对内容进行进一步判断,方便很多相比与if
        let wherePoint = (arc4random()%10,arc4random()%10);
        
        switch wherePoint {
        case (let x,let y) where x == y:
            print("1");
        case (let x,let y) where x < y:
            print("2");
        case (let x,let y) where x > y:
            print("3");
        case (let x,let y):
            print("4");
        }
        
        
    }
    
    /// 控制转移语句
    func otherFunc() {
        //Fallthrough贯穿,值得是在switch语句中不让程序碰到合适的条件停止,而是继续执行,请看下面的代码
        //注意⚠️fallthrough 关键字不会检查它下一个将会落入执行的 case 中的匹配条件,下面会打印a,A
        let a = "a";
        
        switch a {
        case "a":
            print("a")
            fallthrough
        case "b":
            print("A")
            
        default:
            print("c")
        }
        
        
        //标签语法,有点像是封装,其实这个语法说实用也实用说不实用也行,为什么?因为他其实是把系统的某个函数给包装了起来.相当于一个func了
        //举例如下
        
        var num = 0;
        let allNum = 100;
        loop : while num != allNum {
            
            let typeNum = Int(arc4random()%10);
            switch typeNum+num {
            case allNum:
                print(typeNum);
                num += typeNum;
                print("游戏结束");
            case typeNum+num where num+typeNum > allNum:
//                print("游戏异常,此轮不算,重新算");
                continue loop;
            default:
                print(typeNum);
                num += typeNum;
            }
            
        }
        print(num);//结果肯定是100
        
        //guard语句
        let c = 0;
        let d = 12;
        guard c == d else {
            return;
        }
        print("执行");
        //上面这句代码永远不执行,为啥?因为当c = 0时c == d永远不成立,所以直接进else语句
        //当c等于12时会打印执行
        
        
        
        
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
