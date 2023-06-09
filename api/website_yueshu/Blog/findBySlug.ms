{
  "properties" : { },
  "id" : "a764793a2c664bbb84c697612c1f500c",
  "script" : null,
  "groupId" : "5a5f9458d9b44fa4a8c17322fcce7270",
  "name" : "findBySlug",
  "createTime" : null,
  "updateTime" : 1680507775681,
  "lock" : null,
  "createBy" : "admin",
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
    select * from yueshu_website_blog where slug=#{slug}
    """
)

if (blog) {
    var tags = db.camel().select(
        """
        select * from yueshu_website_blog_tag a1 left join yueshu_website_blog_tag_join a2
        on a1.id = a2.tag_id
        where a2.blog_id = #{blog.id}
        """
    )
    blog.tags = tags
}

return blog;