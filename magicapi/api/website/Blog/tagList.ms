{
  "properties" : { },
  "id" : "fea371ac472745d2a264ac35c5fc0e03",
  "script" : null,
  "groupId" : "96a0eee7dd8f4da2a65a69307c3ac4d9",
  "name" : "tagList",
  "createTime" : 1658991998091,
  "updateTime" : null,
  "lock" : null,
  "createBy" : "admin",
  "updateBy" : null,
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
    select * from website_blog_tag
    """
)