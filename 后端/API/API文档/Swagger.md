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

