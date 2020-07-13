//
//  BlockViewController.swift
//  SwiftCourse
//
//  Created by 董德帅 on 2020/7/11.
//  Copyright © 2020 九天. All rights reserved.
//

import UIKit

class BlockViewController: UIViewController {

    
    //定义全局属性
    var globalNum = 12;
    var globalStr:String? = "全局字符串";
    static var globalStaticStr = "静态全局变量";
    
    //定义一个全局的无参无返回值的block
    var block = {() -> () in
        print("调用无参无返回值的block");
    }
    //有参无返回值
    let blockParam = {(s: String) -> () in
        print("调"+s);
    }
    //无参有返回值
    let blockRuturn = {() -> String in
        return "无参数有返回值"
    }
    //有参数有返回值
    let blockParamRuturn = {(s: String) -> (String) in
        return "返回值"+s
    }
    
    
  /**
    全局block,这里使用lazy的作用是确保self已经被初始化了,否则在全局的闭包中不能使用self.
    这个时候使用blockGlobal这个闭包就会引起循环引用.self强引用blockGlobal,blockGlobal强引用self
     */
     lazy var blockGlobal: () -> String = {()->(String) in
        
        //这是一个全局的block
        //在里面调用self的属性
        let n = self.globalStr ?? "22";
        return n;
        
    }
    ///解决的办法使用弱引用或者新增的一个属性无主引用,这里使用弱引用修饰
    ///将需要弱引用的使用weak修饰[weak weakSelf = self,weak delegate = self.delegate]这是个list
     lazy var blockGlobalWeak: () -> String = {[weak weakSelf = self]()->(String) in
        
        //这是一个全局的block
        //在里面调用self的属性
        if let weakS = weakSelf {
            let n = weakS.globalStr ?? "22";
            return n;
        }else{
            return "空的"
        }
        
    }
    
    ///使用无主引用
    ///将需要使用无主引用的使用unowned修饰[unowned weakSelf = self],这是个list
    lazy var blockGlobalUnowned = {[unowned self]()->String in
        
        //这是一个全局的block
        //在里面调用self的属性
            let n = self.globalStr ?? "22";
            return n;
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        blockParam("有参数");
        
        blockTest();
        blockAsParam(str: "字符串", success: {
            //第一个闭包
        }, error: {
            //正常情况blockTwo会被省略掉,但是我不省略,否则看起来代码不容易辨识,当然看个人情况
        })
        
        blockAsParamAndParam(successBlock: { (content, status) in
            print("\(content)状态码\(status)")
        }, errorBlock: {(content,status) in
            print("\(content)状态码\(status)")
        })
        
        blockParamAndReturn(successBlock: { (successContent, status) -> (String) in
            
            let str = "\(successContent)状态码为\(status)返回告诉他成功了我很高兴"
            return str;
            
        },errorBlock: { (errorContent, status) -> (String) in
            
            let str = "\(errorContent)状态码为\(status)返回告诉他失败了无所谓,但是需努力"
            return str;
        })
        
        ///逃逸闭包
        blockEscapingTest();
        ///值捕获
        blockCapture();
        ///循环引用
        blockCirculate();
        // Do any additional setup after loading the view.
    }
    
//    闭包的表现形式
//    { (parameters) -> return type in
//        statements
//    }

    func blockTest() {
        
        //定义一个简单的局部block,
        let appendBlock = {(orignStr: String,appendStr: String) -> String in
            return orignStr + appendStr;
        }
        let orginStr = "原始字符串";
        let appendStr = "新添加的字符串";
        let newStr = appendBlock(orginStr,appendStr);
        print(newStr);
        //通过上面的例子可以多得出一个结论,Swift是值传递
        
        //调用全局的block
        blockParam("调用有参无返回值的block");
        print(blockRuturn());
        print(blockParamRuturn("有参数"));

    }
    
    ///无参数无返回值闭包作为参数,开发中很常见的,block: () -> ()闭包,blockTwo: ()闭包,一般把闭包写在参数的后面
    func blockAsParam(str:String,success: () -> (),error: ()->()) -> () {

        success();
        error();
        
    }
    ///有参数无返回值闭包作为参数,开发中很常见的,block: (String,Int) -> ()闭包
    func blockAsParamAndParam(successBlock: (String,Int) -> (),errorBlock: (String,Int) -> ()) -> () {
        successBlock("成功了",200);
        errorBlock("失败了",404);
    }
    
    ///有参数有返回值闭包作为参数,开发中很常见的,block: (String,Int) -> ()闭包
    func blockParamAndReturn(successBlock: (String,Int)->(String),errorBlock: (String, Int)->(String)) -> () {
        
        let success = successBlock("成功了",200);
        let error = errorBlock("失败了",404);
        print(success);
        print(error);
        
    }
    
    //返回一个block闭包
    //如果单纯返回一个参数这么写 func returnBlock() -> (){}
    //如果返回一个函数参数这么写 func returnBlock() -> ()->Int{},后面的()->Int相当于一个无参带Int返回值的函数
    //其实闭包和函数的写法非常类似
    func returnBlock() -> ()->Int {

        let block = {()->Int in
            
            return 10;
            
        }
        return block;

    }
    ///返回一个函数
    func returnFunc() -> ()->() {

        func blockT ()->(){
            
        }
        return blockT;

    }
    ///有一种情况当闭包作为参数,需要在函数结束后过段时间在执行,这种是逃逸闭包这个时候需要使用@escaping关键字修饰
    ///使用了这个关键字那么所有使用self的必须显示的使用self不能隐式了,就是必须把self写出来
    func blockEscaping(success: @escaping ()->()) -> () {
        
        //将success赋值给block,在合适的时机调用block,blockEscaping的回调正常执行
        block = success;
        
    }
    
    func blockEscapingTest() -> () {
        
        blockEscaping {
            print("测试逃逸");
        };
        //不执行block(),上面的block是不执行回调的
        block();
        
    }
    

    ///闭包的值捕获
    func blockCapture() -> () {
        
        var num = "测试";
        let testBlock = {() -> () in
            num.append("新的字符串");
            self.globalNum = 123;
            self.globalStr = "修改全局字符串"
            BlockViewController.globalStaticStr = "修改静态全局字符串";
        }
        
        testBlock();
        //和OC不一样,局部变量可以直接被修改,不需要被修饰.全局的可以被直接修改.
        //所以在Swift中捕获的是对象不是值了.
        print(num,self.globalStr,self.globalNum,BlockViewController.globalStaticStr);
        
        //测试值的捕获.可以发现即使已经出了作用域,值还是被block一直持有,未被释放
        let blockTest = blockCaptureTest(oraginNum: 10);
        blockTest();//打印为110
        blockTest();//打印为120
        blockTest();//打印为130
        
    }
    
    ///测试值捕获
    func blockCaptureTest(oraginNum: Int) -> ()->() {
        
        var currentNum = 100;
        
        let testBlock = {()->() in
            //这里这个block捕获了currentNum和oraginNum两个值
            currentNum += oraginNum;
            print(currentNum);
        }
        //将block返回
        return testBlock;
    }
    
    ///既然写到了闭包,那么必不可少的一件事就是循环引用,Swift同样会有
    func blockCirculate() -> () {
        
        //下面调用的这个block是会引起循环引用的
        let title = blockGlobal();
        //调用下面的两个block不会出现循环引用的问题
        let titleOne = blockGlobalWeak();
        let titleTwo = blockGlobalUnowned();
        print(title);
        
    }
    ///deinit相当于dealloc
    deinit {
        print("被释放")
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
