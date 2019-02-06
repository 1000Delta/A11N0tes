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