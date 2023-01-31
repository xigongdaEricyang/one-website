{
  "properties" : { },
  "id" : "263357e003f54a9f90e97bbc63a26824",
  "script" : null,
  "groupId" : "96a0eee7dd8f4da2a65a69307c3ac4d9",
  "name" : "findBySlug",
  "createTime" : null,
  "updateTime" : 1667964633908,
  "lock" : null,
  "createBy" : null,
  "updateBy" : "admin",
  "path" : "/findBySlug",
  "method" : "GET",
  "parameters" : [ {
    "name" : "slug",
    "value" : "visualization-tool-release-note",
    "description" : null,
    "required" : true,
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
  "responseBody" : "{\n    \"code\": 1,\n    \"message\": \"参数[slug]为必填项\",\n    \"data\": null,\n    \"timestamp\": 1667964610451,\n    \"executeTime\": 2\n}",
  "description" : null,
  "requestBodyDefinition" : null,
  "responseBodyDefinition" : {
    "name" : "",
    "value" : "",
    "description" : "",
    "required" : false,
    "dataType" : "Object",
    "type" : null,
    "defaultValue" : null,
    "validateType" : "",
    "error" : "",
    "expression" : "",
    "children" : [ {
      "name" : "code",
      "value" : "1",
      "description" : "",
      "required" : false,
      "dataType" : "Integer",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    }, {
      "name" : "message",
      "value" : "参数[slug]为必填项",
      "description" : "",
      "required" : false,
      "dataType" : "String",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    }, {
      "name" : "data",
      "value" : "null",
      "description" : "",
      "required" : false,
      "dataType" : "Object",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    }, {
      "name" : "timestamp",
      "value" : "1667964610451",
      "description" : "",
      "required" : false,
      "dataType" : "Long",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    }, {
      "name" : "executeTime",
      "value" : "2",
      "description" : "",
      "required" : false,
      "dataType" : "Integer",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    } ]
  }
}
================================
var blog = db.camel().selectOne(
    """
    select * from website_blog where slug=#{slug}
    """
)

if (blog) {
    var tags = db.camel().select(
        """
        select * from website_blog_tag a1 left join website_blog_tag_join a2
        on a1.id = a2.tag_id
        where a2.blog_id = #{blog.id}
        """
    )
    blog.tags = tags
}

return blog;