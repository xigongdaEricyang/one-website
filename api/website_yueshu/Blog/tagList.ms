{
  "properties" : { },
  "id" : "c9c298f2fd534aa9b5d3d10004c3531b",
  "script" : null,
  "groupId" : "5a5f9458d9b44fa4a8c17322fcce7270",
  "name" : "tagList",
  "createTime" : null,
  "updateTime" : 1680507967037,
  "lock" : null,
  "createBy" : "admin",
  "updateBy" : "admin",
  "path" : "/tagList",
  "method" : "GET",
  "parameters" : [ ],
  "options" : [ ],
  "requestBody" : "",
  "headers" : [ ],
  "paths" : [ ],
  "responseBody" : null,
  "description" : null,
  "requestBodyDefinition" : null,
  "responseBodyDefinition" : null
}
================================
return db.camel().select(
    """
    select * from yueshu_website_blog_tag
    """
)