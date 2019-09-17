# Markdown流程图

## 语法

例：

```markdown
​```flow
a=>start: Start
b=>operation: a
c=>end: End
a->b->c
​```
```

效果：

```flow
a=>start: Start
b=>operation: a
c=>end: End
a->b->c
```



## 创建元素

语法：

```markdown
tag=>type: content:>url
```

- tag 元素名
- type 元素类型
  - start 开始
  - end 结束
  - operation 操作
  - subroutine 子程序
  - condition 条件
  - inputoutput 输入输出
- content 内容，显示在流程图中
- url 链接，与流程图中的文本绑定



## 连接元素

用`->`来连接元素，其中`condition`类型是条件结构，因此要写出不同条件指向的流程

```markdown
c1(yes)->op1->e
c1(no)->op2->e
```

