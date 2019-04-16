# 服务提供者

# 服务容器

服务容器绑定基本都是在**服务提供者**中绑定, 使用继承自`\Illuminate\Support\ServiceProvider`抽象类中的`$app`对象的方法, `$app`对象为`\Illuminate\Contracts\Foundation\Application`类型. `$app`对象即为我们所指的容器

## 基本方法

```php
/**
 * 用于绑定
 */
/*
bind方法的第二个参数是一个闭包, 负责返回类的实例.
注意在此处闭包使用容器本身作为参数, 然后在闭包中使用容器的make方法对创建的类实例进行了依赖注入(需要的情况下)
*/
$this->app->bind('Namespace\Class', function($app) {
     
    return new Namespace\Class($app->make('AnotherClass'));
});
/*
单例绑定, 在整个生命周期中只会解析一次, 此后对容器的调用将会返回同一个对象实例
*/
$this->app->singleton('Namespace\Class', function($app) {
   
    return new Namespace\Class($app->make('AnotherClass'));
});
/*
绑定一个已存在的实例, 以后对容器的调用将总会返回这个实例
*/
$api = new Namespace\Class(new AnotherClass);
$this->app->instance('Namespace\Class', $api);
/*
上下文绑定
对于不同的类调用同一个接口时,返回不同的实现实例
*/
$this->app->when(FirstClass::class)
    ->needs(Namespace\ClassInterface::class)
    ->give(function() {
        return Namespace\ClassOne();
    });
$this->app->when(SecondClass::class)
    ->needs(Namespace\ClassInterface::class)
    ->give(function() {
        return Namespace\ClassTwo();
    });
/*
标签
当
*/
$this->app->tag(['Namespace\ClassOne', 'Namespace\ClassTwo'], 'classes');
/**/

```

## 使用流程 

1. 需要服务的类在构造方法中指定服务的名称
2. 服务容器将服务名称解析到服务提供者