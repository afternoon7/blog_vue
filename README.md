# blog_vue
forked from sustly/blog_vue_web
### 补充了sql数据库文件，修复部分运行报错

# blog_vue_server

## 博客系统后端
### 使用springboot2.0.1.RELEASE、spring cloud Finchley.SR1、mybaitis、elasticsearch7.1、druid1.1.20、mariadb10.5.8

一、整体框架介绍

1.blog_eureka

    使用eureka作为注册中心，注册了网关、服务提供者、服务消费者、服务发现等组件
    
2.blog_admin_provider_hystrix

    用户登录注册服务
    
3.blog_article_provider_hystrix

    文章管理、获取、查找等功能服务
    
4.blog_api

    一些共用的实体类、api等
    
5.blog_consumer_hystrix_dashboard

    服务监控
    
6.blog_zuul

    网关
    
7.blog_consumer_feign

    基于feign负载均衡的消费者服务
    


# blog_web

> A Vue.js project

## Build Setup

``` bash
# install dependencies
npm install

# serve with hot reload at localhost:8080
npm run dev

# build for production with minification
npm run build

# build for production and view the bundle analyzer report
npm run build --report
```

