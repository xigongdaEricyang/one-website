{
  "properties" : { },
  "id" : "0ee3872859de4defb6e1068563e4fd1a",
  "script" : null,
  "groupId" : "96a0eee7dd8f4da2a65a69307c3ac4d9",
  "name" : "find",
  "createTime" : null,
  "updateTime" : 1660113521316,
  "lock" : null,
  "createBy" : "admin",
  "updateBy" : "admin",
  "path" : "/find",
  "method" : "GET",
  "parameters" : [ {
    "name" : "id",
    "value" : "15",
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
  "responseBody" : null,
  "description" : null,
  "requestBodyDefinition" : null,
  "responseBodyDefinition" : null
}
================================
var blog = db.camel().selectOne(
    """
    select * from website_blog where id=#{id}
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