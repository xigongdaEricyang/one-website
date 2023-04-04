{
  "properties" : { },
  "id" : "bdea09f9d543468ca15282c4a907a157",
  "script" : null,
  "groupId" : "5a5f9458d9b44fa4a8c17322fcce7270",
  "name" : "find",
  "createTime" : null,
  "updateTime" : 1680507738001,
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
    select * from yueshu_website_blog where id=#{id}
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