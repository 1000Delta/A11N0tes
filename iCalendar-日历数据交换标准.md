# iCalendar

> 内容参考自 [维基百科](https://zh.wikipedia.org/wiki/ICalendar) 和 [RFC5545](http://tools.ietf.org/html/rfc5545%7C)

## 基本格式

iCalendar 的所有对象都是由两个标签 `BEGIN:` `END:` 所包围的，标签指定了对象的属性

### 核心对象

核心对象由 `VCALENDAR` 表示

```icalendar
BEGIN:VCALENDAR

END:VCALENDAR
```

### 组件

#### 事件 VEVENT



#### 待办事项 VTODO



### 时间组件属性（Date-time）

#### 开始时间

`DTSTART` 

#### 截止时间

`DTEND` 

### 时区组件属性（Timezone）

### 循环组件属性（Recurrence）

#### 例外时间

`EXDATE`

#### 重复时间

`RDATE`

#### 重复规则

`RRULE`

参数：

- `FREQ` 重复频率
  - `DAILY` `WEEKLY` `MONTHLY` `YEARLY`
- `UNTIL` 截止日期
- `COUNT` 重复次数
- `INTERVAL` 重复间隔
- `WKST` 一周开始
- `BYDAY` 在哪几天重复
  - `DAYLY/WEEKLY`
    - `MO,TU,WE,TH,FR,SA,SU` 每周的周几
  - `MONTHLY`
    - example：`{N}MO` 每个月的第 n 个周一

example:

`RRULE:FREQ=DAILY;UNTIL=20000101T000000`

`RRULE:FREQ=DAILY;INTERVAL=2`

`RRULE:FREQ=WEEKLY;`





