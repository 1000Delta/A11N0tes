# Laravel数据库

## 配置

配置存放在`/.env`中, 以`DB_`开始的配置

## 运行原生 SQL 查询

### 使用`DB`门面

#### 方法

`select($sql, $param)`

`update($sql, $param)`

`insert($sql, $param)`

`delete($sql, $param)`

第一个语句是原生sql语句,第二个语句是需要绑定的参数

参数绑定可以使用`?`占位符和`:name`命名绑定两种

使用`select()`方法返回的数组中, **每一行数据都是一个对象**, 需要通过调用内部属性的方式获取每一个字段值.

`statement()`

运行一个通用语句(例如创建数据库)

`listen()` 监听语句的执行

---

`table($tableName)` 返回一个**流式查询器**实例, 可以进行增删查改

```php
// insert
table($table)->insert([
    'column1' => 'value1',
    'column2' => 'value2'
]);
// 可以一次性传入多个数组来插入多条记录
// 插入记录并返回id值 
table($table)->insertGetId();
// update
DB::table($table)->where()->update(['column' => 'value']);
// delete
DB::table($table)->delete();
// select
table($table)->select($column1, $column2)->get();
    // 获取表中所有记录
    table($table)->get();
    // where()对表中数据进行筛选, first()获取一行数据,为StdClass格式
    table($table)->where($col, $val)->first();
    // 获取指定列的值
    table($table)->where($col, $val)->value($col);
    // 获取包含单个列值的数组, 第二个参数指定自定义键,自定义键必须为表中存在的列
    table($table)->pluck($col[, $keyCol]);
    //将大量数据划分为多个结果集送入闭包中进行处理, 在闭包中返回false来阻止组块的运行
    table($table)->orderBy($col)->chunk($num, function($data) {
        foreach ($data as $val) {
            // todo
            if ($condition) {

                return false
            }
        } 
    });
```

**注意**:

- `where()`语句中有一个参数`boolean`用来标志约束的逻辑判定(AND/OR/NOT), 并且不是指示方法链下一个方法的约束而是当前方法的约束
- 在使用`DB::table()->update()`和`delete()`时，一定要先使用`where()`子句进行约束，避免误操作。



## `Schema`门面

用于对表结构进行操作

```php
# 创建表
Schema::create('table_name', function (Blueprint $table) {
    // Create columns
});
# 检查表/列是否存在
Schema::hasTable('table_name');
Schema::hasColumn('table_name', 'column_name');
# 数据库连接 & 表选项
Schema::connection('db_name')->create('table_name', function (Blueprint $table) {});
# 设置表的存储引擎,字符编码等
## 在Schema闭包中, 使用 $table: Blueprint
$table->engine = 'InnoDB'; # 存储引擎
$table->charset = 'utf8'; # 字符集
$table->collation = 'utf8_unicode_ci'; # 字符序
$table->temporaty(); # 创建临时表
# 重命名/删除表
Schema::rename($from. $to);
Schema::drop($table);
Schema::dropIfExists($table);
# 更新已存在的表
Schema::table($table, function(Blueprint $table) {
    $table->string('name');
});
## 可用的数据列类型
$table->bigIncrements('id'); 		# 自增 UNSIGNED BIGINT (主键) 类型列
$table->bigInteger('votes'); 		# BIGINT
$table->binary('data'); 			# BLOB
$table->boolean('confirmed'); 		# boolean
$table->char('name', 4); 			# CHAR(4)
$table->date('created_at');			# DATE
$table->dateTime('created_at');
$table->dateTimeTz('created_at');
$table->decimal('amount', 5, 2);
$table->double('coluimn', 15, 8);
$table->enum('level', ['easy', 'hard']);
$table->float('amount', 8, 2);
$table->geometry('positions');
## 其余参考laravel文档
$table->mediumInteger('numbers'); 	# 等同于 MEDIUMINT 类型列
$table->mediumText('description'); 	# 等同于 MEDIUMTEXT 类型列 
$table->morphs('taggable');			# 添加一个 UNSIGNED INTEGER 类型的 taggable_id 列和一个 VARCHAR 类型的 taggable_type 列
$table->multiLineString('positions');# 等同于 MULTILINESTRING 类型列
$table->multiPoint('positions'); 	# 等同于 MULTIPOINT 类型列
$table->multiPolygon('positions'); 	# 等同于 MULTIPOLYGON 类型列
$table->nullableMorphs('taggable');	# morphs() 列的 nullable 版本
$table->nullableTimestamps(); 		# timestamps() 的别名
$table->point('position'); 			# 等同于 POINT 类型列
$table->polygon('positions');		# 等同于 POLYGON 类型列
$table->rememberToken(); 			# 等同于添加一个允许为空的 remember_token VARCHAR(100) 列
$table->smallIncrements('id'); 		# 等同于自增 UNSIGNED SMALLINT （主键）类型列
$table->smallInteger('votes'); 		# 等同于 SMALLINT 类型列  
$table->softDeletes();				# 新增一个允许为空的 deleted_at TIMESTAMP 列用于软删除
$table->softDeletesTz(); 			# 新增一个允许为空的 deleted_at TIMESTAMP （带时区）列用 于软删除
$table->string('name', 100); 		# 等同于 VARCHAR 类型列，带一个可选长度参数 
$table->text('description'); 		# 等同于 TEXT 类型列
$table->time('sunrise'); 			# 等同于 TIME 类型列
$table->timeTz('sunrise'); 			# 等同于 TIME 类型（带时区）
$table->timestamp('added_on'); 		# 等同于 TIMESTAMP 类型列
$table->timestampTz('added_on');	# 等同于 TIMESTAMP 类型（带时区）列 
$table->timestamps();				# 添加允许为空的 created_at 和 updated_at TIMESTAMP 类型 列
$table->timestampsTz(); 			# 添加允许为空的 created_at 和 updated_at TIMESTAMP 类型 列（带时区）
$table->tinyIncrements('numbers'); 	# 等同于自增的 UNSIGNED TINYINT 类型列（主键） 
$table->tinyInteger('numbers'); 	# 等同于 TINYINT 类型列 
$table->unsignedBigInteger('votes');# 等同于无符号的 BIGINT 类型列
$table->unsignedDecimal('amount', 8, 2); # 等同于 UNSIGNED DECIMAL 类型列，带有总位数和精度 

$table->unsignedInteger('votes'); # 等同于无符号的 INTEGER 类型列
$table->unsignedMediumInteger('votes'); # 等同于无符号的 MEDIUMINT 类型列 
$table->unsignedSmallInteger('votes'); # 等同于无符号的 SMALLINT 类型列 
$table->unsignedTinyInteger('votes'); # 等同于无符号的 TINYINT 类型列 
$table->uuid('id'); 				# 等同于 UUID 类型列
$table->year('birth_year');  		# 等同于 YEAR 类型列
```

