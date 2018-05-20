## 命名规范

- **类**的命名用“大驼峰式”命名（即名称首字母和每个单词首字母大写），**属性（变量）**和**方法（函数）**的命名使用“小驼峰式”（名称首字母消息但之后的每个单词首字母大写）  

  ```php
  Class MyClass {
  
  private myName;
  
  public function getName(string $name) {
  
  $this->myName = $name;
  }
  }
  
  $thisIsVar = 'variable';
  
  function doSome() {
  
  //todo
  }
  ```

- **接口**在名称前加上`i`，**trait**在名称前加上`t`

  ```php
  interface iSome {
      
      // a interface
  }
  
  trait tSome {
      
      // a trait
  }
  ```
