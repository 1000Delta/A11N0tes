# Java去除浮点数后多余0

## 使用的类库

```java
import java.util.Formatter;
import java.math.BigDecimal;
```

## 方法

```Java
private static void printNoMoreZero(double val) {

        Formatter rmZero = new Formatter();
        // 进行格式化截断尾部小数并转化成字符串
        String rm = ""+rmZero.format("%g", val);
        // 将字符串解析成double并存入大数类
        BigDecimal todo = BigDecimal.valueOf(Double.parseDouble(rm));
        // 将数去0输出
        System.out.println(todo.stripTrailingZeros());
    }
```