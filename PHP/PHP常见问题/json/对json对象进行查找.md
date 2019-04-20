# 查找json键名

- `property_exists()` 检查对象或类是否具有该属性
- `get_object_vars()`获取json对象的属性构成的数组，然后`foreach()`遍历，可以使用`$target as $key => $val`遍历查找或者`$target as $val` 循环体中使用`key()`获取当前key