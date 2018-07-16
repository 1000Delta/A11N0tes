# PHP验证码

相关函数：

````php
resource imagecreatetruecolor($x, $y);
// 设置验证码图片大小
imagecolorallocate($image, $red. $green. $blue);
// 设置验证码颜色
imagefill($image, $x, $y, $color);
// (x, y)所在的区域着色
imagestring($image, $fontsize, $x, $y, 	$fontcontent, $fontcolor);
//填充图片

````