# Swagger 语法

## PHP Annotation

### 引入OA

### 标题部分

```
/**
 * @OA\OpenApi(
 *     @OA\Server(
 *         url="localhost",
 *         description="API 服务器"
 *     )
 *     @SWG\Info(
 *         version="1.0.0",
 *         title="the API",
 *         description="the description of API"
 *     )
 * )
 */
```

### 分类部分

使用标签`Tag`

```
/**
 * API标签分类
 * @OA\Tag(
 *     name="search",
 *     description="搜索相关"
 * )
 *
 * @OA\Tag(
 *     name="update",
 *     description="更新数据相关"
 * )
 *
 * @OA\Tag(
 *     name="external",
 *     description="额外接口"
 * )
 */
```

### Api部分

```php
/**
 * @OA\Get(
 *     path="/search/{key}",
 *     tags={"search"},
 *     summary="分页搜索",
 *     description="返回查询到的页面列表",
 *     operationId="searchWebPage",
 *     @OA\Parameter(
 *         name="key",
 *         in="path",
 *         description="要搜索的关键词/句",
 *         required=true,
 *         @OA\Schema(
 *             type="string",
 *             default="关键字"
 *         )
 *     ),
 *     @OA\Response(
 *         response=200,
 *         description="查询成功",
 *         @OA\JsonContent(
 *             type="array",
 *             @OA\Items(
 *                 ref="#"
 *             )
 *         )
 *     ),
 *     @OA\Response(
 *         response=400,
 *         description="查询失败"
 *     )
 * )
 */
```

#### 参数

##### OA\Get

- `path`
- `tags`
- `summary`
- `description`
- `operationId`

##### OA\Parameter

Parent: `Get`

- `name`
- `in`
- `description`
- `required`

#####@OA\Schema

Parent: `Parameter`

- `type`
  - string
  - 
- `default`