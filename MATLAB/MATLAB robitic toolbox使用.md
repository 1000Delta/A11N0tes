# MATLAB robotic toolbox使用

> <https://blog.csdn.net/libing403/article/details/81879649>

## 齐次坐标变换

### 平移齐次坐标变换

```matlab
% 创建一个沿x,y,z平移的平移齐次坐标变换矩阵T
T = transl(x, y, z);
p = [x, y, z];
T = transl(p);

% 从齐次坐标变换矩阵T中获取平移分量
[x, y, z] = transl(T);
p = transl(T);
```

### 旋转齐次坐标变换

```MATLAB
% 绕x, y, z旋转r得到旋转齐次坐标变换矩阵T
T = trotx(r)
T = troty(r)
T = trotz(r)
```

