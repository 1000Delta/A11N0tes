# PHP验证码（图形学）

相关函数：

````php
resource imagecreatetruecolor($x, $y);
// 设置验证码图片大小
imagecolorallocate($image, $red. $green. $blue);
// 设置验证码颜色
imagefill($image, $x, $y, $color);
// (x, y)所在的区域着色
imagestring($image, $fontsize, $x, $y, 	$fontcontent, $fontcolor);
// 填充图片
imagepng($image);
// 将图片保存到文件或者直接将图片流输出，类似的还有imagejpeg()等
imagesetpixel($image, $x, $y, $color);
// 在image中(x, y)坐标上用color颜色画一个点
````

