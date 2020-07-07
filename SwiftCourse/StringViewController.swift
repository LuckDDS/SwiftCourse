//
//  StringViewController.swift
//  SwiftCourse
//
//  Created by 董德帅 on 2020/7/6.
//  Copyright © 2020 九天. All rights reserved.
//

import UIKit

class StringViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        strOtherFunc();
        // Do any additional setup after loading the view.
    }
    func buildStr(){
        
        //定义字符串
        let str = "系统会自动推断为字符串";
        let str1: String = "我们自己告诉str1对象这是字符串";
        let str2: String? = "声明一个可选类型的字符串对象str2,告诉系统str2可以为nil,使用时要解包";
        var str3 = "";//这是一个空字符串
        var str4 = String();//初始化一个字符串
        str4 = "字符串赋值";
        
        let str5 = String(format: "%@%@", arguments: [str,str1])
        
        let str6 = String(format: "%@%@", str,str1);
        
        //判断字符串是否为空
        if str4.isEmpty {
            print("字符串为空")
        }
        
        //定义一个可变字符串
        var str7: String? = "111";
        //定义一个不可变字符串
        let str8: String?;
        str8 = "123";
                
        let str13 = """
                        这是
                        多行
                        字符串的
                        声明方式
                    """;
        //对于换行的这个"""用法很有讲究,但是不打算深研究,因为基本用不到,所以到此为止,知道就行
    }
    /// 字符的使用
    func character()  {
        
        let str = "qwertyuiop";
        
        for character in str {
            print(character);
        }
        
        //字符只能包含一个字符
        //定义一个字符
        let character: Character = "a";
        //定义一个字符数组
        let characters: [Character] = ["a","b"];
        print(character,characters);
    }
    
    /// 字符串插值
    func insertStr() {
        
        let str = "333";
        let str2 = "\(str)金子\(str)银子\(str)票子";
        print(str2);
        //打印结果:333金子333银子333票子
        
        let str3 = "\(str)金子\(str.count)票子";
        print(str3);
        //打印内容:333金子3票子
        
        let num: [String] = ["测试","是否可以取值"];
        let str4 = "第\(num.count)\(num.first ?? "默认值")\(num.last ?? "没事哈哈")";
        print(str4);
        //打印内容:第2测试是否可以取值
    }
    /// 字符串实用技巧
    func strFunctional() {
        
        let char: Character = "a";
        var strVar: String = "测试用的变量字符串";
        
        strVar.append(char);
        print(strVar.count);//10
        print(strVar.lengthOfBytes(using: String.Encoding.unicode));//20
        print(strVar.lengthOfBytes(using: String.Encoding.utf8));//28
        print(strVar.lengthOfBytes(using: String.Encoding.utf16));//20
        print(strVar.lengthOfBytes(using: String.Encoding.utf32));//40
        //上面的打印结果不同与计算方式不同有关
        //Unicode编码：一个英文等于两个字节，一个中文（含繁体）等于两个字节
        //UTF-8:一个英文等于一个字节，一个中文（含繁体）等于三个字节
        //UTF-16:一个英文等于两个字节，一个中文（含繁体）等于两个字节
        //UTF-32:一个英文等于四个字节，一个中文（含繁体）等于四个字节
        //说明一下.count采用的是Unicode编码计算的

        
        //目前的字符串的截取有点个性,不仔细研究不容易理解.现在不使用int类型坐标去取,而是使用的String.index
        var str: String! = "abcde测试数据";
        
        //获取第一位
        let charFirst = str.first;
        print(charFirst ?? "");
        
        //获取最后一位
        let charLast = str.last;
        print(charLast ?? "");
        
        //这个获取的是位置,从字符串头部开始下标为3的坐标,strCoord是一个String.index类型的坐标
        let strCoord1 = str.index(str.startIndex, offsetBy: 3);
        //获取strCoord1坐标的内容
        let str1 = str[strCoord1];
        print(str1);//d
        
        /**
            再获取一个坐标1,解释一下strCoord2坐标的来历,一步步的分析
            (1)str.startIndex是指坐标0
            (2)after的出现是说str.index函数返回的坐标是str.startIndex的下一个,也就是1
         */
        let strCoord2 = str.index(after: str.startIndex);
        //获取strCoord2坐标的内容
        let str2 = str[strCoord2];
        print(str2);//b
        //##警告⚠️endIndex这个坐标不能直接使用,会越界,他的坐标是字符串的长度.
        //再获取一个坐标7,跟上面的基本一致只不过获取的是最后坐标的前一个
        let strCoord3 = str.index(before: str.endIndex);
        let str3 = str[strCoord3];
        print(str3);//据
        
        
        
        
//        let strCoord4 = str.index(<#T##i: String.Index##String.Index#>, offsetBy: <#T##String.IndexDistance#>, limitedBy: <#T##String.Index#>)
        
        //        let str1 = str.distance(from: <#T##String.Index#>, to: <#T##String.Index#>)

        
        //获取指定位置的字符
        let charOther = str[str.index(after: str.startIndex)]
        print(charOther);
        
        
        
        
        
    }
    
    /// 学习构造StringIndex
    /// - Returns: void
    func buildStringIndex() -> () {
        //为什么使用String.Index呢?因为不同的字符可能占用不同数量的内存空间,所以要知道 Character 的确定位置，就必须从 String 开头遍历每一个 Unicode 标量直到结尾。因此，Swift 的字符串不能用整数（integer）做索引。
        //接下来就开始定义String.Index了
        
        let str = "asdfghjkl";
        
        //获取第一个字符的index
        let strFirstIndex = str.startIndex;
        
        //获取最后一个字符的index,注意⚠️:这个endIndex不能直接使用会越界的
        let strLastIndex = str.endIndex;
        
        //获取某个坐标之前的坐标.         endIndex这个时候可以用
        let strBeforeIndex = str.index(before: str.endIndex);
        
        //获取某个坐标之后的坐标
        let strAfterIndex = str.index(after: str.startIndex);
        
        //获取从头部开始数第三位的坐标
        let strAssignIndex = str.index(str.startIndex, offsetBy: 3);
        
        //获取从第三位开始数第二位的坐标,即第五
        let strFiveIndex = str.index(strAssignIndex, offsetBy: 2);
        
        //与上面的方法类似,只不过增加了范围限制
        let strLimiteIndex = str.index(strAssignIndex, offsetBy: 2, limitedBy: strFiveIndex);
        
        //获取的是从开始到结束位置之间的距离,
        let strDistanceIndex = str.distance(from: str.startIndex, to: strAssignIndex);
        
        
        
    }
    
    /// 使用StringIndex方式截取字符串
    /// - Returns: void
    func strSubByStringIndex() -> () {
            
        let str = "asdfghjkl";
        //注意坐标初始值为0
        //获取第一个字符
        let strFirstIndex = str.startIndex;
        print(str[strFirstIndex]);//a
        
        //获取最后一个字符的index,注意⚠️:这个endIndex不能直接使用会越界的
        let _ = str.endIndex;//这个不能直接使用需要组合使用
        
        //获取某个坐标之前的字符.         endIndex这个时候可以用
        let strBeforeIndex = str.index(before: str.endIndex);
        print(str[strBeforeIndex]);//l
        
        //获取某个坐标之后的字符
        let strAfterIndex = str.index(after: str.startIndex);
        print(str[strAfterIndex]);//s
        
        //获取从头部开始数第三位的字符
        let strAssignIndex = str.index(str.startIndex, offsetBy: 3);
        print(str[strAssignIndex]);//f
        
        //获取从第三位开始数第二位的字符,即第五
        let strFiveIndex = str.index(strAssignIndex, offsetBy: 2);
        print(str[strFiveIndex]);//h
        
        //这个方法和上面的基本一致,只不过限制了一下范围,而且得加判断,因为他的返回值是String.Index?,可选类型
        let strLimiteIndex = str.index(strAssignIndex, offsetBy: 2, limitedBy: strAssignIndex);
        if let i = strLimiteIndex {
            print(str[i]);
        }else{
            print("越界")
        }
        
        //返回某个String.Index后的所有字符串,包括String.Index当前位置的字符串
        let strSuffix = str.suffix(from: strFiveIndex);
        print(strSuffix);//hjkl
        
        //返回某个String.Index之前的所有字符串,不包括String.Index当前位置的字符串
        let strPrefix = str.prefix(upTo: strFiveIndex);
        print(strPrefix);//asdfg
        
        //截取strFiveIndex之后的字符串,包括String.Index当前位置的字符串
        let strLenAfter = str[strFiveIndex...];
        print(strLenAfter);//hjkl
        
        //截取strFiveIndex之前的字符串,包括strFiveIndex当前位置的字符串
        let strLenBefore = str[...strFiveIndex];
        print(strLenBefore);//asdfgh
        
        //截取strFiveIndex之前的字符串,不包括strFiveIndex当前位置的字符串
        let strLenBefore1 = str[..<strFiveIndex];
        print(strLenBefore1);//asdfgh

        
        //截取两个String.Index之间的字符串,包括strFiveIndex当前位置的字符串
        let strBetween = str[strAfterIndex...strFiveIndex];
        print(strBetween);//sdfgh

        //截取两个String.Index之间的字符串,不包括strFiveIndex当前位置的字符串
        let strBetween1 = str[strAfterIndex..<strFiveIndex];
        print(strBetween1);//sdfg
        

    }
    /// 通过range截取字符串
    func strSubByRange() {

        let str = "asdfghjkl";

        let range = NSMakeRange(3, 3);
        
        let strStartIndex = str.index(str.startIndex, offsetBy: range.lowerBound);
        let strEndIndex = str.index(str.startIndex, offsetBy: range.upperBound);

        //包含strEndIndex
        print(str[strStartIndex...strEndIndex]);
        //不包含strEndIndex
        print(str[strStartIndex..<strEndIndex]);
        
        
    }
    
    /// 字符串的其他用法
    func strOtherFunc()  {
        
        var str = "asdfghjklaaffaaa";
        
        //声明一个range,String.index的区间
        let rangeTestOne = str.startIndex...str.index(str.startIndex, offsetBy: 3);
        
        
        //拼接字符串
        str.append("bbb");
        print(str);
        
        //删除指定字符,字符是一个,只删除最先找到的,后面的不删除
        //先找到位置
        let index = str.firstIndex(of: "f");
        if let i = index {
            str.remove(at: i);
        }
        print(str);
        
        //删除多个字符
        let range = NSMakeRange(0, 4);
        let bounds = Range.init(range, in: str);
        if let b = bounds {
            str.removeSubrange(b);
        }
        print(str);
        
        //还有一种声明range的方式,可能要简单直观些
        let rangeTest = str.startIndex..<str.index(str.startIndex, offsetBy: 1);
        str.removeSubrange(rangeTest);
        print(str);

        
        //字符串转数组
        let arr = str.components(separatedBy: "f");
        print(arr);
        
        //字符串比较
        let test = "123";
        let result = str.compare(test);
        print(result)
        
        //字符串是否包含
        if str.range(of: "asd") != nil {
            print("包含")
        }
        
        //替换,所有的都会被替换
        let replace = str.replacingOccurrences(of: "a", with: "3");
        print(replace);
        
        //区间替换,区间内的内容都被替换
        let rangeOne = Range.init(NSMakeRange(0, 3), in: str);
                
        if let range = rangeOne {
            
            str.replaceSubrange(range, with: "????");
            
        }
        
        print(str);
        
        //前后缀
        if str.hasSuffix("asd") {
            
        }
        if str.hasPrefix("asd") {
            
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
