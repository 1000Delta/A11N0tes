# PHP 面向对象

> **面向过程与面向对象的区别**：
以“人吃饭”举例：
**面向过程**所关注的是“吃”这个行为，以“吃”这个过程为主体，再去关注谁来吃，吃什么。
**面向对象**关注的是“人”这个对象，先确定了某个人，再执行这个人所具有的行为“吃”，吃的目标是“饭”。

## 面向对象内容

- **类** 定义了一件事务的抽象特点。类的定义包含了数据的形式以及对数据的操作。
- **对象** 是类的实例。
- **成员变量** 定义在内部的变量，该变量的值对外部是不可见的，但是可以通过成员函数访问，在类被实例化成对象之后，该变量即可称为对象的属性。
- **成员函数** 定义在类的内部，可用于访问对象的数据。
- **继承** 继承是子类自动共享父类数据结构和方法的机制，这是类之间的一种关系。在定义和实现一个类的时候，可以在一个已经存在的类的基础之上来进行，把这个已经存在的类所定义的内容作为自己的内容，并加入若干新的内容。
- **父类** 一个类被其他类继承，可将该类称为父类，或基类，或超类。
- **子类** 一个类继承其他类称为子类，也可称为派生类。
- **多态** 多态是指相同的函数或方法可作用与多种类型的对象上并获得不同的结果。不同的对象，收到同一消息可以产生不同的结果，这种现象称为多态性。
- **重载** 就是函数或者方法有同样的名称，但是参数列表不相同的情形，这样的同名不同参数的函数或者方法之间，互相称为重载函数或者方法。
- **抽象性** 抽象性是指将具有一致的数据结构（属性）和行为（操作）的对象抽象成类。一个类就是这样一种抽象， 它反映了与应用有关的重要性质，而忽略其他一些无关内容。任何类的划分都是主观的，但必须与具体的应用有关。
- **封装性** 封装是指将现实世界中存在的某个客体的属性与行为绑定在一起，并放置在一个逻辑单元内。
- **构造函数** 主要用来在创建对象时初始化对象，即为对象成员变量赋初始值，总与new运算符一起使用在创建对象的语句中。**PHP中，如果在子类中创建了构造函数，则子类不会在构造函数中隐式调用父类中的构造函数，要执行父类的构造函数，需要在子类的构造函数中调用`parent::__construct()`。如果子类中没有定义构造函数则会如同普通类一样从父类继承（非private）**
- **析构函数** 析构函数（destructor）与构造函数相反，当对象结束其生命周期时（例如对象所在的函数以调用完毕），系统自动执行析构函数。析构函数往往用来做“清理善后”的工作（例如在建立对象时用new开辟了一片内存空间，应在退出前在析构函数中用delete释放）。

### 访问控制参数

- `public` 可被类及其实例化的对象直接调用  
- `protected` 只能被类、其父类及其子类**内部**的方法所调用（可以被继承）
- `private` 只能被类内部的方法调用（不能被继承）

### `static` 关键字

在访问控制参数后使用此参数可以将属性/方法定义为全局属性/全局方法（静态属性/静态方法）

可以在不实例化的情况下调用这些属性/方法

访问：

- 在类内使用 `static::$attr/func()` 或者 `self::$attr/func()` 来调用
- 在类内使用 `parent::$attr/func()` 来调用父类的静态属性/方法
- 在外部使用 `ClassName::$attr/func()` 来调用

> 自 PHP 5.3.0 起，可以用一个变量来动态调用类。但该变量的值不能为关键字z self，parent 或 static。 
`

类似于 Java 中的类变量和类

### 多态

PHP5 引入了一个新关键字-类型运算符 `instanceof` 有三个作用：

- 实例是否某个特定的类型
- 实例是否从某个特定的类型继承
- 实例或者它的任何祖先类是否实现了特定的接口

语法：

```php
if ( $obj instanceof Class ) {
    //do something
}
```

**注意**：`instanceof` 作为**类型运算符**是一个二元运算符，左侧为判断的实例，右侧为**需要判断的类名**，类名不需要使用界定符（括号）包围，否则将会被视为语法错误。

利用 `instanceof` 关键字可以实现对不同类的实例进行不同的响应，即多态的实现。  
使用多态可以提高方法和函数的泛用性。

### 封装性

封装性的概念就是要让对象内部的属性和方法尽可能的成为一个整体，并尽可能的对外界遮蔽实现的细节，包含两个含义：

1. 把对象的全部属性和全部方法结合在一起，成为一个不可分割的整体（即对象）
2. 尽可能对外界隐藏内部的属性，只保留有限的接口与外界进行联系。

封装的原则在软件上的反映是：要求使对象以外的部分不能随意存取对象的内部数据（属性），从而有效的避免了外部错误对它的"感染"，使软件错误能够局部化，大大减少查错和排错的难度。

实现方式：

- 使用 `private` 关键字对属性和无需在外界调用的方法进行约束
- 对于外界需要改变或者获取属性的行为用操作属性的接口来实现

---

示例：

```php
<?php
Class People {

    private $name, $age, $sex;
    static private $type = 'animal';
    
    function __construct($name, $sex) {

        $this->name = $name;
        $this->age = 0;
        $this->sex = $sex;
    }

    function getInfo() {

        echo "Name:".$this->name;
        echo "Age:".$this->age;
        echo "Sex:".$this->sex;
    }

    function yearsPassBy($years) {

        $this->age += $years;
    }

    static function getType() {

        echo static::$type;
    }

    function __destruct() {

        echo $this->name." dead.";
    }
}

class Male extends People { // 继承 people 类

    function __construct($name) {

        parent::__construct($name, 'male'); // 继承 people 类中的构造器
    }

    function setCouple($someone) { //多态的实现，对 Male 和 Female 两种类的实例做出不同处理。

        if ($someone instanceof Male) {

            echo "摔♂跤？";
        } elseif ($someone instanceof Female) {

            echo "FFF？";
        }
    }
}

class Female extends People { // 继承 people 类

    function __construct($name) {

        parent::__construct($name, 'female'); // 继承 people 类中的构造器
    }

    function setCouple($someone) {

        if ($someone instanceof Male) {

            echo "FFF？";
        } elseif ($someone instanceof Female) {

            echo "搞姬？";
        }
    }
}

$first = new male('路人甲');
$second = new female('路人乙');

// echo $first->name; //非法操作
// $second->age += 20; //非法操作

$first->yearsPassBy(20);
$second->yearsPassBy(20);
$first->getInfo();
$second->setCouple($first);
People::getType();  //调用类方法输出类变量
//最后将会输出 路人甲 dead 路人乙 dead
```