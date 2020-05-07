# C 多线程编程

## 线程管理

### 1. 线程创建

**POSIX**

```c
int pthread_create(pthread_t* tidp,const pthread_attr_t* attr, (void*)(*start_rtn)(void*),void* arg);
```

- `tidp` 指向线程标识符的指针
- `attr` 设置线程属性
- `start_rtn` 线程运行函数的指针
- `arg` 线程运行函数的参数

返回值：`0` 成功 `-1` 错误

**Linux**

---

### 2. 线程退出

**POSIX**

```c
void pthread_exit(void* retval)
```

- `retval` 指向要返回的对象的指针

**Linux**

---

### 3. 线程等待

**POSIX**

```c
int pthread_join(pthread_t thread, void **retval);
```

- `thread` 等待退出的线程号
- `retval` 退出线程的返回对象

返回值：`0` 成功，其他为错误号

主线程需要等待子线程结束，否则主线程直接退出会导致子线程没有执行完

**Linux**

## 互斥锁

### 初始化互斥锁锁

**POSIX**

动态初始化函数：

```c
int pthread_mutex_init(pthread_mutex_t *restrict_mutex,const pthread_mutexattr_t *restrict_attr);
```

- `restrict_mutex` 互斥锁指针
- `restrict_attr` 互斥锁属性指针
  - `NULL` 默认值，快速互斥锁
  - 其他值通过 `pthread_mutexattr_init(&restrict_attr)` 来初始化对象
    - 取值范围
      - `PTHREAD_PROCESS_PRIVATE` 缺省值，只能被初始化线程所属的进程中的线程共享
      - `PTHREAD_PROCESS_SHARED` 可以跨线程共享 

返回值：

- `0` 成功，其他均为错误

编译期初始化：

```c
pthread_mutex_t *mutex_nomal = PTHREAD_MUTEX_NOMAL; // 公平锁
pthread_mutex_t *mutex_errorcheck = PTHREAD_MUTEX_ERRORCHECK; // 自检锁
pthread_mutex_t *mutex_recursive = PTHREAD_MUTEX_RECURSIVE; // 嵌套锁
pthread_mutex_t *mutex_default = PTHREAD_MUTEX_DEFAULT; // 默认
```

#### 互斥锁属性对象操作

```c
int pthread_mutexattr_init(pthread_mutexattr_t* attr);
int pthread_mutexattr_destroy(pthread_mutexattr_t* attr);
int pthread_mutexattr_getshared(const pthread_mutexattr_t* attr, int* pshared);
int pthread_mutexattr_setshared(pthread_mutexattr_t* attr, int* pshared);8
```

### 锁操作

```c
int pthread_mutex_lock(pthread_mutex_t *mutex)
int pthread_mutex_unlock(pthread_mutex_t *mutex)
int pthread_mutex_trylock(pthread_mutex_t *mutex)
```

`pthread_mutex_trylock` 和 `pthread_mutex_lock` 差不多，但是在锁被其他线程占用时不会阻塞而是返回 `EBUSY`

## 自旋锁

#### 初始化

```c
int pthread_spin_destroy(pthread_spinlock_t *lock);
int pthread_spin_init(pthread_spinlock_t *lock, int pshared);
```

- `lock` 初始化自旋锁锁对象的指针
- `pshared` 自旋锁参数

#### 操作

```c
int pthread_spin_lock(pthread_spinlock_t *lock);
int pthread_spin_trylock(pthread_spinlock_t *lock);
int pthread_spin_unlock(pthread_spinlock_t *lock);
```


> 参考：
>
> https://blog.csdn.net/zhaopengnju/article/details/52068108
>
> [多线程的同步与互斥](https://blog.csdn.net/daaikuaichuan/article/details/82950711)

