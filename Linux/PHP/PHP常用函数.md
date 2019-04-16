# PHP常用函数
## 数组

### 长度

#### `count($array)`

#### `sizeof($array)` 

count的别名

### 存在性



## 排序

### 数组排序
* 参数
    * array : array
    * [sort_flags : int]
        * 用于改变排序的行为
        * 取值
            * SORT_REGULAR 正常比较单元
            * SORT_NUMRIC 单元被作为数字来比较
            * SORT_STRING 单元作为字符串来比较（字典序）
            * SORT_LOCALE_STRING 根据当前的区域（locale）设置来把单元当作字符串来比较

#### sort()

对数组升序排序

#### rsort()

对数组降序排序

#### asort()

根据值对关联数组升序排序

#### ksort()

根据键对关联数组进行排序

#### arsort()

根据值对关联数组降序排序

#### krsort()

根据键对关联数组降序排序

## 字符串
### implode()
* 返回由数组元素组合成的字符串
* 参数
    * [seperator : string = '']
        * 数组元素之间放置的内容
    * array : array
## XML解析
### simpleXML
#### simplexml_load_file()

* 从文件获取simpleXMLElement对象
* 参数
    * filename : string
    * [class_name : string]
        * "simpleXMLElement"
    * ...

#### simplexml_load_string()

* 从字符串获取simpleXMLElement对象
* 参数
    * data : string
    * ...

#### class simpleXMLElement

* 这个对象以解析出的XML元素作为属性，当解析后的XML元素包含元素时，将会此属性也会是一个SimpleXMLElement对象
* 方法
    * children()
        * 获取所有子节点

## 时间日期
### 时区
#### date_default_timezone_get()

* 获取当前脚本使用时区

#### date_default_timezone_set()

* 设置当前脚本使用时区
* 参数
    * $timezone_identifier : string

### Unix时间戳
#### time()

* 输出当前Unix时间戳

### 日期/时间
#### date()

* 输出当前日期/时间
* 参数
    * $format : string
        * 格式
            * `d`	月份中的第几天，有前导零的2 位数字	01 到31
                `D`	英文星期几，3个字母	Mon到Sun
               ` j`	月份中的第几天，没有前导零	1 到31
               ` l`(字母)	英文星期几	Sunday到 Saturday
               ` N`	1格式数字表示的星期	1（表示星期一）到7（表示星期天)
               ` S`	每月天数后面的英文后缀，2个字符	st，nd，rd或者th。可以和jg一起用
               `w`	星期中的第几天，数字表示	0（表示星期天）到 6（表示星期六）
               ` z`	一年中的第几天	0到366
                `W`	年份中的第几周，每周从星期一开始	42（当年的第42周）
               ` F`	月份，完整的文本格式	January 到 December
               ` m`	数字表示月份，有前导零	01 到 12
                `M`	3个字母缩写表示的月份	Jan 到Dec
                `n`	数字表示月份，没有前导零	1 到 12
               ` t`	给定月份所应有的天数	28 到 31
               ` L`	是否为闰年	如果是闰年为1，否则为o
                `o`	格式年份数字	例如2007
                `Y`	4 位数字完整表示年份	例如1999或2008
               ` y`	2 位数字表示的年份	例如99或08
                `a`	小写的上午和下午值	am或pm
               ` A`	大写的上午和下午值	AM或PM
                `g`	小时，12小时格式，没有前导零	1到12
               ` G`	小时，24小时格式，没有前导零	0 到 23
                `i`	有前导零的分钟数	00 到 59
                `s`	秒数，有前导零	00到59
                `e`	时区标识	
                `U`	从Unix纪元开始至今的秒数	长整型数字
    * [$timestamp : int]
        * 将要输出的时间戳

## 输入输出
### sprintf()

打印格式化字符串到字符串

## cURL
见[cURL](扩展&包/Client URL 库 (curl)/curl函数.md)

## 正则表达式
### `preg_match($pattern, $subject [, $matches])`
* 匹配成功返回1，失败返回0
* 参数
    * pattern : string
        * 正则表达式模式
    * subject : string
        * 需要匹配检索的对象
    * [matches : array]
        * 可选参数，存储匹配结结果的数组，$matches[0]将包含与整个模式匹配的文本，$matches[1] 将包含与第一个捕获的括号中的子模式所匹配的文本，以此类推
### `preg_match_all($pattern, $subject, $matches [, $flags])`
* 进行正则表达式全局匹配，成功返回整个模式匹配的次数（可能为0），如果出错返回 FALSE
* 参数
    * pattern : string
        * 正则表达式
    * subjects : string
        * 需要匹配的对象
    * matches : array
        * 存储匹配结果的数组
        * $mahes[0]
    * [flags: int]
*XMind: ZEN - Trial Version*