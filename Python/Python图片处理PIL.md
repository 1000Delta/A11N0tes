# Python图片处理

PIL (Python Imaging Library)是Python最常用的图片处理库

## 模块

### Image

---

#### 图像融合

```python
PIL.Image.alpha_composite(im1, im2)
PIL.Image.blend(im1, im2, alpha)
PIL.Image.composite(im1, im2, mask)
```

被融合的两个图像的mode和size都要相同

- `alpha` 透明度
- `mask` 

#### 像素处理

```python
PIL.Image.eval(img1, lambda i: i*2)
```

对图像的每个像素执行函数



### ImageDraw

---

用来对2D图像进行创建和修改操作

#### 绘制图像

```python
PIL.ImageDraw,bitmap(xy, bitmap, fill=NULL)
PIL.ellipse(xy, fill=None, outline=None)
PIL.ImageDraw.pieslice(xy, start, end, fill=None, outline=None)
PIL.ImageDraw.polygon(xy, fill=None, outline=None)
PIL.ImageDraw.rectangle(xy, fill=None, outline=None)
PIL.ImageDraw.text(xy, text, fill=None, font=None, anchor=None, spacing=0, align=”left”, direction=None, features=None)
```

