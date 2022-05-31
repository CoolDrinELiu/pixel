# 数字影像社区平台

## 技术栈

- [Rails 7](https://rubyonrails.org/) - 主要技术框架。

### Response 结构 (OK)

```json
{
  "data": {},
  "result": true,
  "msg": ""
}
```

### Response 结构 (Not OK)

```json
{
  "status": "",
  "data": {
    "msg": ""
  }
}
```

### 提交前的规范测试
```shell
  overcommit --run

  //如果修改了 overcommit.yml
  overcommit --sign pre-commit
  overcommit --run
```

### 压缩css
```shell
  yarn run build:css
```

### 本地启动服务
```shell
  foreman start -f Procfile.dev
```