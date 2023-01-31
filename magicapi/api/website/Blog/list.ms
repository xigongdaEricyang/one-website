{
  "properties" : { },
  "id" : "db6523ef9ed44fac87d6a51cf02ea2eb",
  "script" : null,
  "groupId" : "96a0eee7dd8f4da2a65a69307c3ac4d9",
  "name" : "list",
  "createTime" : null,
  "updateTime" : 1675133925846,
  "lock" : null,
  "createBy" : null,
  "updateBy" : "admin",
  "path" : "/list",
  "method" : "GET",
  "parameters" : [ {
    "name" : "page",
    "value" : "2",
    "description" : null,
    "required" : false,
    "dataType" : "String",
    "type" : null,
    "defaultValue" : null,
    "validateType" : null,
    "error" : null,
    "expression" : null,
    "children" : null
  }, {
    "name" : "pageSize",
    "value" : "10",
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
  "requestBody" : "{\n    \"title\": \"BDD\",\n    \"page\": 1,\n    \"pageSize\": 1\n}",
  "headers" : [ ],
  "paths" : [ ],
  "responseBody" : "{\n    \"code\": -1,\n    \"message\": \"系统内部出现错误\",\n    \"data\": null,\n    \"timestamp\": 1675133913008,\n    \"executeTime\": 1286\n}",
  "description" : null,
  "requestBodyDefinition" : {
    "name" : "root",
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
      "name" : "title",
      "value" : "BDD",
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
      "name" : "page",
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
      "name" : "pageSize",
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
    } ]
  },
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
      "value" : "-1",
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
      "value" : "系统内部出现错误",
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
      "value" : "1675133913008",
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
      "value" : "1286",
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
var tagData;

if (tag) {
    tagData = db.camel().selectOne(
    """
    select * from website_blog_tag where name = #{tag}
    """
    )
}

if (tagId) {
    tagData=db.camel().selectOne(
    """
    select * from website_blog_tag where id = #{tagId}
    """
    )
}

var related_blogIds;

if (tagData) {
    related_blogIds = db.camel().select(
        """
        select * from website_blog_tag_join where tag_id = #{tagData.id}
        """
    ).map(i => i.blogId)
}

var blogs;
if (categoryName) {
    blogs = db.camel().page("""
        select website_blog.*, website_blog_category.name as category_name from website_blog
        left join website_blog_category on website_blog.blog_category_id = website_blog_category.id 
        where website_blog_category.name = #{categoryName}
        ?{related_blogIds != null, and website_blog.id in (#{related_blogIds})}
        ?{title != null, and website_blog.title like "%"#{title}"%"}
        ?{author != null, and website_blog.author like "%"#{author}"%"}
        ?{publish != null, and website_blog.publish = #{publish}}
        order by website_blog.publish_time desc 
    """)
} else if (categoryId) {
    blogs = db.camel().page("""
        select website_blog.*, website_blog_category.name as category_name from website_blog
        left join website_blog_category on website_blog.blog_category_id = website_blog_category.id
        where website_blog_category.id = #{categoryId}
        ?{related_blogIds != null, and website_blog.id in (#{related_blogIds})}
        ?{title != null, and website_blog.title like "%"#{title}"%"}
        ?{author != null, and website_blog.author like "%"#{author}"%"}
        ?{publish != null, and website_blog.publish = #{publish}}
        order by website_blog.publish_time desc 
    """)
} else if (related_blogIds) {
    blogs = db.camel().page("""
        select website_blog.*, website_blog_category.name as category_name from website_blog
        left join website_blog_category on website_blog.blog_category_id = website_blog_category.id
        where website_blog.id in (#{related_blogIds})
        ?{title != null, and website_blog.title like "%"#{title}"%"}
        ?{author != null, and website_blog.author like "%"#{author}"%"}
        ?{publish != null, and website_blog.publish = #{publish}}
        order by website_blog.publish_time desc 
    """)
} else if (title) {
        blogs = db.camel().page("""
        select website_blog.*, website_blog_category.name as category_name from website_blog
        left join website_blog_category on website_blog.blog_category_id = website_blog_category.id
        where title like "%"#{title}"%"
        ?{author != null, and website_blog.author like "%"#{author}"%"}
        ?{publish != null, and website_blog.publish = #{publish}}
        order by website_blog.publish_time desc 
    """)
} else if (author) {
    blogs = db.camel().page("""
        select website_blog.*, website_blog_category.name as category_name from website_blog
        left join website_blog_category on website_blog.blog_category_id = website_blog_category.id
        where author like "%"#{author}"%"
        ?{publish != null, and website_blog.publish = #{publish}}
        order by website_blog.publish_time desc 
    """)
} else if (publish != null) {
    blogs = db.camel().page("""
        select website_blog.*, website_blog_category.name as category_name from website_blog
        left join website_blog_category on website_blog.blog_category_id = website_blog_category.id
        where website_blog.publish = #{publish}
        order by website_blog.publish_time desc 
    """)
} else {
        blogs = db.camel().page("""
        select website_blog.*, website_blog_category.name as category_name from website_blog
        left join website_blog_category on website_blog.blog_category_id = website_blog_category.id
        order by website_blog.publish_time desc 
    """)
}

blogs.list = blogs.list || []
 blogs.list.map(blog => {
    var tags = db.camel().select(
        """
        select * from website_blog_tag a1 left join website_blog_tag_join a2
        on a1.id = a2.tag_id
        where a2.blog_id = #{blog.id}
        """
    )
    blog.tags = tags
})

return blogs;