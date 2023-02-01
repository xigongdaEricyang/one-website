{
  "properties" : { },
  "id" : "96c5bb4715284615ae8b45769fe83b3f",
  "script" : null,
  "groupId" : "96a0eee7dd8f4da2a65a69307c3ac4d9",
  "name" : "findByTagId",
  "createTime" : null,
  "updateTime" : 1660047284512,
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
    select * from website_blog_tag where id=#{tagId}
    """
)

return tags;