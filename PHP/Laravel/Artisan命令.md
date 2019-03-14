# Artisan命令

```bash
# make命令 创建相关文件
## 生产相关
php artisan make:controller Name # 创建控制器
php artisan make:middleware Name # 创建中间件
php artisan make:model Name # 创建ORM Eloquent模型
## 数据库迁移&测试相关
php artisan make:migration Name # 创建数据库迁移
php artisan make:migration Name --create=table # 预填充要创建的表
php artisan make:migration Name --table=table # 预填充要操作的表
php artisan make:factory Name # 创建模型工厂
php artisan make:factory Name --model=Model # 通过给定的模型名称预填充生成的工厂类
php artisan make:seeder Name # 创建数据库填充器
## 测试相关
php artisan make:test Name # 创建测试
php artisan make:test Name --unit # 创建单元测试

php migrate # 执行数据库迁移
php db:seed # 执行默认填充器 DatabaseSeeder
php db:seed --class=Name # 执行指定填充器
```

