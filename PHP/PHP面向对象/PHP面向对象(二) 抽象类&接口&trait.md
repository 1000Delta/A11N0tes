# PHP 面向对象(二) 抽象类&接口&trait

## 抽象类（abstract）

先看抽象类的定义，官方文档：

> PHP 5 支持抽象类和抽象方法。定义为抽象的类不能被实例化。任何一个类，**如果它里面至少有一个方法是被声明为抽象的，那么这个类就必须被声明为抽象的**。被定义为抽象的方法只是声明了其调用方式（参数），不能定义其具体的功能实现。

> 继承一个抽象类的时候，子类必须定义父类中的所有抽象方法；另外，这些方法的访问控制必须和父类中一样（或者更为宽松）。例如某个抽象方法被声明为受保护的，那么子类中实现的方法就应该声明为受保护的或者公有的，而不能定义为私有的。此外方法的调用方式必须匹配，即类型和所需参数数量必须一致。例如，子类定义了一个可选参数，而父类抽象方法的声明里没有，则两者的声明并无冲突。 这也适用于 PHP 5.4 起的构造函数。在 PHP 5.4 之前的构造函数声明可以不一样的。

定义中提到了抽象方法，抽象方法的声明和C语言中的函数声明很相似，不需要实现其功能，抽象方法的实现均在抽象类的子类中进行。

抽象类的语法结构：

```php
abstruct class Class1 {
    
    //普通方法
    public method1() {
        
        //todo
    }
    
    //抽象方法
    abstruct public aMethod1 ();
}
```

若对以上抽象类`Class1`继承到子类，则子类必须实现其中抽象方法`aMethod1()`的功能，对于普通方法则可以直接继承。

---

在某些用到继承概念的场景中，创建一个父类的实例会显得不合适，例如在Animal->Cat的关系中，直接使用Animal来建立对象就不适合，因此，我们应该在这里将Animal定义为一个抽象类。通过继承Animal抽象类来创建子类Cat，Cat类需要实现所有的在Animal类中声明的抽象方法。


## 接口（interface）

PHP和大多数语言一样，不支持多继承（即继承多个类），PHP采用和Java类似的方式，通过单继承和接口来实现与多继承相似的功能，同时也避免了多继承的[“钻石问题”](https://cn.bing.com/search?q=%E5%A4%9A%E7%BB%A7%E6%89%BF+%E9%92%BB%E7%9F%B3%E9%97%AE%E9%A2%98)

官方文档：

> 使用接口（interface），可以指定某个类必须实现哪些方法，但不需要定义这些方法的具体内容。  

> 接口是通过 interface 关键字来定义的，就像定义一个标准的类一样，但其中定义所有的方法都是空的。

> 接口中定义的所有方法都必须是公有，这是接口的特性。

### 接口 vs 抽象类

在某种程度上，我们可以将接口看作一种特殊的抽象类，便于理解；在接口中，只有方法而没有属性，并且所有的方法均为抽象方法，访问控制权限均为`public`，这也是由接口的特性所决定的（在一般的定义中，接口就是对象与外界进行交互的部分）。**抽象类和接口的区别主要是抽象类和派生类的关系是“继承（extends）”或者说“是一个”，而接口和派生类的关系是“实现（implements）”**。

抽象类和接口的另一区别是抽象类依然是“类”，遵循PHP中类的基本原则，不能多继承，抽象类与接口之间也不能相互继承。而接口独立存在，接口可以通过`extends`继承多个接口，而类也可以通过`implements`来实现多个接口。

接口语法：

```php
interface iSome1 { 
    //作为惯例，接口名字经常以一个小写的i开始，但是这并不是必须的
    
    public function someFunction($var);
}

interface iSome2 {
    
    //todo
}

class SomeClass implements iSome1, iSome2 {
    //实现多个接口
    
    //todo
}
```


## trait

官方文档
> 自 PHP 5.4.0 起，PHP 实现了一种代码复用的方法，称为 trait。

> Trait 是为类似 PHP 的单继承语言而准备的一种代码复用机制。Trait 为了减少单继承语言的限制，使开发人员能够自由地在不同层次结构内独立的类中复用 method。Trait 和 Class 组合的语义定义了一种减少复杂性的方式，避免传统多继承和 Mixin 类相关典型问题。

> Trait 和 Class 相似，但仅仅旨在用细粒度和一致的方式来组合功能。 无法通过 trait 自身来实例化。它为传统继承增加了水平特性的组合；也就是说，应用的几个 Class 之间不需要继承。

trait 可以创建一个通用方法的组合，通过在不同的类中调用trait，可以在不同的类中复用相同的方法。

### trait vs 接口

> trait 看起来和接口很相似，但是二者有很大的区别，接口是为了将类设计为实现特定的方法，而trait正好相反，它设计为让类可用某些未在其中定义的方法。

trait语法：

```php
trait tSomeTrait {
    // 惯例，一个trait的名称一般在开头加上一个字母t
    
    function someFunction() {}
}

class SomeClass {
    
    use tSomeTrait;
    
}
```

trait之间可以相互嵌套，类似于类的继承：

```php
trait tSomeTrait1 {
    
    function someFunc1() {}
}

trait tSomeTrait2 {
    
    function someFunc2() {}
}

class SomeClass {
    
    use tSomeTrait2;
}

SomeClass::someFunc1();
someClass::someFunc2();
```

trait中也可以加入抽象方法，这样使用（use）它的类就必须实现这些方法：

```php
trait tSomeTrait {
    
    abstract function someFunc();
}
```

> 参考资料：  
[PHP Manual](php.net)  
《深入理解PHP 高级技巧，面向对象与核心技术》--机械工业出版社  

> ——还有大神们的分享 :)