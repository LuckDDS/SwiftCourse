//
//  ViewController.swift
//  SwiftCourse
//
//  Created by 董德帅 on 2020/6/30.
//  Copyright © 2020 九天. All rights reserved.
//

import UIKit
enum CarError:Error {
    case CarErrorNoIll
    case CarErrorNoMoney
    case CarErrorNoPeople
}
class BasicsController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        typeAnnotation(str: "asd")
        optionalsTest();
        errorHandle();
        // Do any additional setup after loading the view.
    }
    
    /// 常量和变量
    func letWithVar() {
        //定义常量使用let关键字,常量只能被赋值一次
        let letNum = 90;
        //letNum = 80;
        
        //像这种声明常量但暂不指定值的需要指定存储的类型才行,这叫类型注解,下面会有介绍
        let letNumOne : Int8;
        letNumOne = 38;
        //声明多个相同类型的常量,只需要在最后进行类型注解
        let q,w,e : Int8;
        
        //声明变量和常量的方式一模一样,区别是变量可以改变值
    }
    
    /// 类型注解
    func typeAnnotation(str: String) {
        
        //当你声明常量或者变量的时候可以加上类型注解（type annotation），说明常量或者变量中要存储的值的类型。
        //如果要添加类型注解，需要在常量或者变量名后面加上一个冒号和空格，然后加上类型名称。
        
        //在声明常量或者变量时如果直接赋值的话不需要进行类型注解,因为编译器会根据赋值的内容自动推断.
        var s: String;
        s = "声明的时候是字符串只能接收字符串类型";
        var str = "str是字符串类型,直接赋值可以不注解";
        
        var num = 12;
        var numTemp: Int8;
        numTemp = 12;
        
        let letNum: Int8;
        letNum = 12;
        
        let letNumTemp = 12;

        //方法中有传参数,必须使用注解,比如当前的方法
        
    }
    ///类型转换
    func typeConversion(){
        
        let num8: Int8 = 12;
        let num16: Int16 = 123;
        //let result = num16 + num8;这样会报错因为类型不同不可操作
        //将低类型转为高类型即可
        let result = num16 + Int16(num8);
        
        print(result);
        
    }
    /// 元组
    func tuples(){
        
        //元组里面可以存储任意的类型
        //定义一个元组
        let tuplesTest = (123,"123123");
        //取元组里面的值使用,需要给元组中的内容命名
        let (status,content) = tuplesTest;
        print(status,content);
                
        let tuplesTemp = (status,content);
        print(tuplesTemp.0,tuplesTemp.1);//这种不建议,可读性太差
        
        //还有一种方式就是在定义元组的时候给对应的内容命名
        let tuplesTempOne = (statusOne:123,statusTwo:"测试内容");
        print(tuplesTempOne.statusOne,tuplesTempOne.statusTwo);//可读性强
            
        //元组作为返回值
        let (statu,alert,page) = returnTuples();
        print(statu,alert,page);//完美
        
    }
    
    func returnTuples() -> (Int16,String,Int8) {
        
        let httpStatus = (status:Int16(404),alert:"找不到网页",page:Int8(12));
        return httpStatus;
        
    }
    
    /// 可选类型
    func optionalsTest()  {
     
        //定义一个可选字符串,optionalStr可以为nil
        var optionalStr: String?;
        //定义一个可选Int,optionalInt可以为nil
        var optionalInt: Int? = 12;
        //nil代表的值缺失,optionalStr和optionalInt现在都是nil
        
        //强制解析,在变量或常量后面加'!',对可选对象进行强制解析即可使用其值
        //但是需要判断可选对象是否为nil,不检测的话如果值为nil,那么会报错
        if optionalInt != nil {
            NSLog("optionalInt有值,可以进行强制解析,值为:%d", optionalInt!);
        }else{
            NSLog("optionalInt无值,不可以进行强制解析,进行强制解析会崩溃!");
        }
        
        
        //可选绑定,不要看名字,看下面的用法(名字起的真好...)
        if let optionalS = optionalStr {
            NSLog("%@", optionalS);
        }else{
            print("optionalStr是nil");
        }
        //上面的代码的意思就是如果optionalStr这个可选对象不是nil的话,就将optionalStr里面存储的值 赋值给optionalS,不需要进行解包操作了,可以直接使用optionalS
        
        //可以使用let也可以使用var,下面的是且的关系,都为真才为真
        if let optionalS = optionalStr , var optionalI = optionalInt {
            print("optionalStr和optionalInt都有值");
        } else {
            print("optionalStr或optionalInt有一个或者都是nil");
        }
        
        
        //隐式解析可选类型
        //举个🌰我定义了一个常量str而且初始化了值,所以我确定在接下来的使用过程中str这个可选类型肯定有值,这个时候就可以使用隐式解析可选类型,即将?替换为!
        let str: String! = "123";
        //下面使用时就不需要进行解包操作,可以直接使用
        let strT:String = str+"asd";
        print(strT);
        print(str+"asd");

        
    }
    
    //错误处理
    func errorHandle(){
        do {
            try buildCar();
            print("没毛病造车成功");
        } catch CarError.CarErrorNoIll {
            print("没油");
        } catch CarError.CarErrorNoMoney{
            print("没钱了");
        } catch CarError.CarErrorNoPeople{
            print("没人买");
        }catch{
            print("未知错误");
            //这个空的catch必须要加上,不然会报错
        }
        
    }
    
    func buildCar() throws{
        
        throw CarError.CarErrorNoMoney;
    }
    
    
}

