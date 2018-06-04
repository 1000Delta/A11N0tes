# DP入门练习

## POJ-1163 The Triangle

先尝试使用dfs

```java
package test;

import java.io.BufferedInputStream;
import java.util.*;

public class Main {

    private int[][] triangle;
    private int max = 0;

    private void setTriangle(int[][] triangle) {

        this.triangle = triangle;
    }

    private int max (int a, int b) {

        return a>b?a:b;
    }

    private int dfs (int depth, int position, int md, int mp) {

        if (depth >= md || position >= mp) {

            return 0;
        }

        int num = max(dfs(depth+1, position, md, mp), dfs(depth+1,position+1, md, mp));
        return triangle[depth][position] + num;
    }


    public static void main (String[] args) {

        Scanner in = new Scanner(new BufferedInputStream(System.in));
        Main t = new Main();

        int[][] tri = new int[100][100];

        int i, j = 0, n = in.nextInt();
        for (i = 0; i < n; i++) {

            for (j = 0; j < i+1; j++) {

                tri[i][j] = in.nextInt();
            }
        }

        t.setTriangle(tri);

        System.out.println(t.dfs(0, 0, i, j));
    }
}
```

然后学习到了解法：每个元素只计算一次，自底向上计算，从倒数第二行开始，每个元素都加上其下一行的**对应位置元素**和下一行**对应位置+1的元素**中**较大**的那个，最后集中到第一行第一个元素即为最大值。

即状态方程为
$$
f(x, y) = \begin{cases}
f(x, y), &x = N \\
f(x+1, y) + f(x+1, y+1),  &0 < x < N
\end{cases}
$$


复杂度由
$$
O(n)
$$
降到了
$$
O(log_2 n)
$$

```java
package test;

import java.io.BufferedInputStream;
import java.util.*;

public class Main {

    public static void main (String[] args) {

        Scanner in = new Scanner(new BufferedInputStream(System.in));

        int[][] tri = new int[100][100];

        int i, j = 0, n = in.nextInt();
        for (i = 0; i < n; i++) {

            for (j = 0; j < i + 1; j++) {

                tri[i][j] = in.nextInt();
            }
        }

        for (i -= 1; i > 0; i--) {

            for (j = i-1; j >= 0; j--) {

                tri[i-1][j] += tri[i][j]>tri[i][j+1]?tri[i][j]:tri[i][j+1];
            }
        }

        System.out.println(tri[0][0]);
    }
}

```



## POJ-2533 Longest Ordered Subsequence

求最长有序增加子序列

首先以第一个元素为首，遍历后续所有元素，以后续所有大于首元素的元素构成一个序列（不一定要保存，但是要记录），求出**元素数目**，然后在求未在序列中的元素为首的序列，取**元素数目**最多的序列，对求出的子序列重复步骤，复杂度约为
$$
O(n^2)
$$
状态方程为
$$
f(x)
$$


 