# Python网络爬虫 BeautifulSoup4库

**BeautifulSoup 类**
   ` BeautifulSoup(data, parser)`
    处理HTML数据或者XML数据
    解析器（parser）类型：

> html.parser  #pip install BeautifulSoup4
>  lxml    #pip install lxml
>  xml    #pip install lxml
>  html5lib    #pip install html5lib

基本元素：
`.{Tag}` Tag对应名字的第一个标签
`.name`    Name标签名字
`.attrs`    Attribute标签属性
`.string`    NavigableString标签内容
`.comment`  Comment注释内容

**标签树的遍历**：
    下行遍历：
        `.contents`    子节点的列表
        `.children`    子结点的迭代类型，用于循环遍历儿子节点
        `.descendants`    子孙节点的迭代类型， 用于循环遍历子孙节点
    上行遍历：
        `.parent`    父节点
        `.parents`    先辈节点的迭代类型
    平行遍历：
        `.next_sibling`    返回按照HTML文本顺序的下一个平行节点标签
        `.previous_sibling`    返回按照HTML文本顺序的上一个平行节点**标签**
        `.next_siblings`    迭代类型，返回后续所有平行节点标签
        `.previous_siblings`    迭代类型，返回前续所有平行节点标签

**方法**：
    `.prettify()`    在每个标签后加换行符，使HTML代码更易读
    `.fing_all(name, attrs, recursive, string, **kwargs)`
        `name`: 对标签名称的检索字符串
        `attrs`: 对标签属性值的检索字符串，可标注属性检索
        `recursive`: 是否对子孙节点全部搜索，默认为True
        `string`: 
        `**kwargs`:
    简写：
        `(...)` 等价于 `.find_all(...)`
        `soup(...)` 等价于 `soup.find_all(...)`
    **扩展方法**：
        `.find()`    搜索且只返回一个结果，字符串类型，同.find_all()参数
        `.find_parents()`    在先辈节点中搜索，返回列表类型，同.find_all()参数
        `.find_parent()`    在先辈节点中返回一个结果，字符串类型，同.find()参数
        `.find_next_siblings()`    在后续平行节点中搜索，返回列表类型，同.find_all()参数
        `.find_next_sibling()`    在后续平行节点中返回一个结果，字符串类型，同.find()参数
        `.find_previous_siblings()`    在前续平行节点中搜索，返回列表类型，同.find_all()参数
        `.find_previous_sibling()`    在前续平行节点中返回一个结果，字符串类型，同.find()参数