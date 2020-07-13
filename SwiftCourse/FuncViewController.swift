//
//  FuncViewController.swift
//  SwiftCourse
//
//  Created by 董德帅 on 2020/7/9.
//  Copyright © 2020 九天. All rights reserved.
//

import UIKit

class FuncViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let (min,max) = funcParamNoneReturns();
        print(min);
        print(max);
        
        let data = funcParamNoneReturnOther();
        print(data.min);
        print(data.max ?? 0);
        
        funcVarParams(type: "1",varParam: "2","3","4");
        
        funcDefineTest();
        
        let num = funcAsParam(addNumTest: addNum(_:_:));
        print(num);
        
        funcSuper();
        
        //returnFunc这个时候就相当于funcAsReturnTest函数,然后就可以直接调用
        let returnFunc = funcAsReturn(m: 12, n: 23, e: 34);
        print(returnFunc(12,23,43));
        // Do any additional setup after loading the view.
    }
    
    /// 无参无返回值
    func funcParamNoneReturnNone() -> () {
        
    }
    /// 无参带返回值
    /// - Returns: string
    func funcParamNoneReturn() -> (String) {
        
        return "返回值";
        
    }
    /// 多参数
    func funcParamsNoneReturn(str : String,num : Int) -> () {
        
        
    }
    ///返回多个参数,使用元组,之前讲过
    func funcParamNoneReturns() -> (Int,Int) {

        return (1,2);
    }
    ///返回多个参数,还可以这样用,声明返回值的名字
    func funcParamNoneReturnOther() -> (min: Int,max: Int?) {
        
        return (1,nil);
        
    }
    ///对返回值进行可选处理
    func funcParamNoneReturnOtherOne(type: String) -> (min: Int,max: Int)? {
        if type == "1" {
            return nil;
        }else{
            return (1,2);
        }
    }
    //还有可以忽略return语句,我是不建议,所以就不写了
    
    ///参数标签label,他的作用是让函数语句表达更清晰,实际没什么作用
    func funcLabel(label data: String) -> () {
        
        
    }
    
    ///默认参数,即给形参加上默认值
    func funcDefaultData(type: String = "1") -> () {
        
        //调用这个方法时,如果type有值就没事,没值的话就会自动设置默认值"1"
        
    }
    
    ///如果参数类型一致,且多个的话可以使用可变参数,就是这个参数相当于一个数组,这个得写一下,不然容易出错
    ///注意⚠️一个函数最多只能拥有一个可变参数。
    func funcVarParams(type: String, varParam: String...) -> () {
        //varParam就是可变参数
        for item in varParam {
            print(item);
        }
    }
    
    ///将函数重新命名定义,举例如下
    func funcDefineTest() -> () {
        
        //下面的两种写法均可
        let tempFunc : (Int,Int)->(Int) = addNum;
//        let tempFunc : (Int,Int)->(Int) = addNum(_:_:);
        let num = tempFunc(1,2);
        print(num);
        
    }
    
    func addNum(_ first: Int, _ second: Int) -> Int {
        
        return first+second;
        
    }
    
    ///函数作为返回类型,定义一个返回的函数的参数及返回的类型
    func funcAsReturn(m: Int,n: Int,e: Int) ->(Int,Int,Int)->(String){
        
        //funcAsReturnTest(a:b:c:)这个返回的函数必须和funcAsReturn中定义的返回函数中的参数数量类型什么的都一致
        return funcAsReturnTest(a:b:c:);
        
    }
    func funcAsReturnTest(a: Int,b: Int,c: Int) -> String {
        
        return String(a+b+c);
        
    }
    
    ///函数作为参数,感觉有点鸡肋,在设计模式中可用,但是普通的代码中用处不大
    func funcAsParam(addNumTest: (_ first: Int,_ second: Int)->(Int)) -> (Int) {
        
        return addNumTest(2, 4);
    }
    
    ///嵌套函数,跟C又很像了
    func funcSuper() -> (){
        
        //这个方法只有在当前可以访问,private
        func funcSub() -> (Int){return 10};
        print(funcSub());
        
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
