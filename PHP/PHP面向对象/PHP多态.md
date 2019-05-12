# PHP多态

> 由于PHP是弱类型语言，因此函数的输入参数类型无法确定（可以使用类型暗示，但是类型暗示无法用在诸如整型，字符串之类的标量类型上），并且对于一个函数，比如只定义了3个输入参数，PHP却运行调用的时候输入4个或者更多的参数。因此基于这2点，注定了PHP中无法重载函数，（类似Javascript语言），也无法有构造函数的重载。(来源于[网络](https://www.cnblogs.com/endv/p/8583534.html))

对于普通的方法，有两种方式进行函数的重载:

- 魔术方法`_call`

  ```php
  <?php
  class A {
      function __call($name, $args) {
          if ($name == 'f') {
              
              $i = count($args);
              call_user_func_array(array($this, 'f'.$i), $args);
          }
      }
      
      function f1() {
          // do something...
      }
      
      function f2() {
          
          // do something...
      }
  }
  
  $obj = new A();
  A->f(1);
  A->f(1,2);
  ```

- 在指定方法中使用`get_func_args()`函数

  ```php
  <?
  class A {
      function f() {
          
          $args = func_get_args();
          $i = count($args);
          call_user_func_array(array($this, 'f'.$i), $args);
      }
      
      function f1() {
          // do something...
      }
      
      function f2() {
          
          // do something...
      }
  }
  
  $obj = new A();
  A->f(1);
  A->f(1,2);
  ```

经测试，对于构造方法只能使用第二种方法实现重载。

## `call_user_func` 和 `call_user_func_array`

这两个函数非常像，都是通过函数名调用一个函数，其中，对于OOP的调用，对于类方法和对象方法需要使用不同的方式。

两个函数的不同点在于，`call_user_func`调用函数传递的参数是不定参数，具体来说是`call_user_func($name, $arg1, $arg2, $arg3, ...)`，而`call_user_func_array`只有两个参数，传递的两个参数是函数名和由传递参数构成的数组。



```php
<?php
class A {
    
    static function f1($a, $b) {}
    
    function f2() {
        
        // do something
    }
}
function f3() {
    
    // do something
}
// 两种方式调用类方法
call_user_func(array('A', 'f1'), $arg1, $arg2);
call_user_func('A::f1', $arg1, $arg2);
// 调用对象方法
$obj = new A();
call_user_func(array($obj, 'f3'));    
// 调用全局函数
call_user_func('f3');
```

