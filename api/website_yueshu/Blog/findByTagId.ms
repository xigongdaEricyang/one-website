{
  "properties" : { },
  "id" : "ef230415af2146bab3a2111d7897f077",
  "script" : null,
  "groupId" : "5a5f9458d9b44fa4a8c17322fcce7270",
  "name" : "findByTagId",
  "createTime" : null,
  "updateTime" : 1680507781217,
  "lock" : null,
  "createBy" : "admin",
  "updateBy" : "admin",
  "path" : "/findByTagId",
  "method" : "GET",
  "parameters" : [ {
    "name" : "tagId",
    "value" : "3",
    "description" : null,
    "required" : false,
    "dataType" : "String",
    "type" : null,
    "defaultValue" : null,
    "validateType" : null,
    "error" : null,
    "expression" : null,
    "children" : null
  } ],
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
var tags = db.camel().select(
    """
    select * from yueshu_website_blog_tag where id=#{tagId}
    """
)

return tags;