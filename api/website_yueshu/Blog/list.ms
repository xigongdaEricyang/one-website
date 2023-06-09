{
  "properties" : { },
  "id" : "c396afddd43d4fc9bda3b8087ba717d1",
  "script" : null,
  "groupId" : "5a5f9458d9b44fa4a8c17322fcce7270",
  "name" : "list",
  "createTime" : null,
  "updateTime" : 1680509768395,
  "lock" : null,
  "createBy" : "admin",
  "updateBy" : "admin",
  "path" : "/list",
  "method" : "GET",
  "parameters" : [ {
    "name" : "page",
    "value" : "1",
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
  "responseBody" : "{\n    \"code\": 0,\n    \"message\": \"success\",\n    \"data\": {\n        \"total\": 2,\n        \"list\": [{\n            \"id\": 1,\n            \"createTime\": \"2023-04-03T15:56:26\",\n            \"updateTime\": \"2023-04-03T16:06:24\",\n            \"author\": \"c\",\n            \"content\": \"fafaf\",\n            \"description\": \"d\",\n            \"pic\": \"https://www-cdn.nebula-graph.com.cn/nebula-website-5.0/images/blogs/NUC2022/overview/NUC-2022.jpg\",\n            \"publish\": true,\n            \"publishTime\": null,\n            \"slug\": \"b\",\n            \"title\": \"a\",\n            \"createUserId\": 1,\n            \"updateUserId\": 1,\n            \"blogCategoryId\": 1,\n            \"categoryName\": \"a\",\n            \"tags\": []\n        }, {\n            \"id\": 2,\n            \"createTime\": \"2023-04-03T15:57:19\",\n            \"updateTime\": \"2023-04-03T15:57:19\",\n            \"author\": \"f\",\n            \"content\": \"faf\",\n            \"description\": \"s\",\n            \"pic\": \"a\",\n            \"publish\": false,\n            \"publishTime\": null,\n            \"slug\": \"58.Com-Inc-operation-maintenance\",\n            \"title\": \"a\",\n            \"createUserId\": 1,\n            \"updateUserId\": 1,\n            \"blogCategoryId\": 1,\n            \"categoryName\": \"a\",\n            \"tags\": [{\n                \"id\": 1,\n                \"createTime\": \"2023-04-03T15:41:12\",\n                \"updateTime\": \"2023-04-03T15:41:12\",\n                \"name\": \"a\",\n                \"other\": \"f\",\n                \"createUserId\": 1,\n                \"updateUserId\": 1,\n                \"blogId\": 2,\n                \"tagId\": 1\n            }]\n        }]\n    },\n    \"timestamp\": 1680509766192,\n    \"executeTime\": 21\n}",
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
      "value" : "0",
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
      "value" : "success",
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
        "name" : "total",
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
      }, {
        "name" : "list",
        "value" : "",
        "description" : "",
        "required" : false,
        "dataType" : "Array",
        "type" : null,
        "defaultValue" : null,
        "validateType" : "",
        "error" : "",
        "expression" : "",
        "children" : [ {
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
            "name" : "id",
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
            "name" : "createTime",
            "value" : "2023-04-03T15:56:26",
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
            "name" : "updateTime",
            "value" : "2023-04-03T16:06:24",
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
            "name" : "author",
            "value" : "c",
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
            "name" : "content",
            "value" : "fafaf",
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
            "name" : "description",
            "value" : "d",
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
            "name" : "pic",
            "value" : "https://www-cdn.nebula-graph.com.cn/nebula-website-5.0/images/blogs/NUC2022/overview/NUC-2022.jpg",
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
            "name" : "publish",
            "value" : "true",
            "description" : "",
            "required" : false,
            "dataType" : "Boolean",
            "type" : null,
            "defaultValue" : null,
            "validateType" : "",
            "error" : "",
            "expression" : "",
            "children" : [ ]
          }, {
            "name" : "publishTime",
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
            "name" : "slug",
            "value" : "b",
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
            "name" : "title",
            "value" : "a",
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
            "name" : "createUserId",
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
            "name" : "updateUserId",
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
            "name" : "blogCategoryId",
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
            "name" : "categoryName",
            "value" : "a",
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
            "name" : "tags",
            "value" : "",
            "description" : "",
            "required" : false,
            "dataType" : "Array",
            "type" : null,
            "defaultValue" : null,
            "validateType" : "",
            "error" : "",
            "expression" : "",
            "children" : [ ]
          } ]
        } ]
      } ]
    }, {
      "name" : "timestamp",
      "value" : "1680509766192",
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
      "value" : "21",
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
    select * from yueshu_website_blog_tag where name = #{tag}
    """
    )
}

if (tagId) {
    tagData=db.camel().selectOne(
    """
    select * from yueshu_website_blog_tag where id = #{tagId}
    """
    )
}

var related_blogIds;

if (tagData) {
    related_blogIds = db.camel().select(
        """
        select * from yueshu_website_blog_tag_join where tag_id = #{tagData.id}
        """
    ).map(i => i.blogId)
}

var blogs;
if (categoryName) {
    blogs = db.camel().page("""
        select yueshu_website_blog.*, yueshu_website_blog_category.name as category_name from yueshu_website_blog
        left join yueshu_website_blog_category on yueshu_website_blog.blog_category_id = yueshu_website_blog_category.id 
        where yueshu_website_blog_category.name = #{categoryName}
        ?{related_blogIds != null, and yueshu_website_blog.id in (#{related_blogIds})}
        ?{title != null, and yueshu_website_blog.title like "%"#{title}"%"}
        ?{author != null, and yueshu_website_blog.author like "%"#{author}"%"}
        ?{publish != null, and yueshu_website_blog.publish = #{publish}}
        order by yueshu_website_blog.publish_time desc 
    """)
} else if (categoryId) {
    blogs = db.camel().page("""
        select yueshu_website_blog.*, yueshu_website_blog_category.name as category_name from yueshu_website_blog
        left join yueshu_website_blog_category on yueshu_website_blog.blog_category_id = yueshu_website_blog_category.id
        where yueshu_website_blog_category.id = #{categoryId}
        ?{related_blogIds != null, and yueshu_website_blog.id in (#{related_blogIds})}
        ?{title != null, and yueshu_website_blog.title like "%"#{title}"%"}
        ?{author != null, and yueshu_website_blog.author like "%"#{author}"%"}
        ?{publish != null, and yueshu_website_blog.publish = #{publish}}
        order by yueshu_website_blog.publish_time desc 
    """)
} else if (related_blogIds) {
    blogs = db.camel().page("""
        select yueshu_website_blog.*, yueshu_website_blog_category.name as category_name from yueshu_website_blog
        left join yueshu_website_blog_category on yueshu_website_blog.blog_category_id = yueshu_website_blog_category.id
        where yueshu_website_blog.id in (#{related_blogIds})
        ?{title != null, and yueshu_website_blog.title like "%"#{title}"%"}
        ?{author != null, and yueshu_website_blog.author like "%"#{author}"%"}
        ?{publish != null, and yueshu_website_blog.publish = #{publish}}
        order by yueshu_website_blog.publish_time desc 
    """)
} else if (title) {
        blogs = db.camel().page("""
        select yueshu_website_blog.*, yueshu_website_blog_category.name as category_name from yueshu_website_blog
        left join yueshu_website_blog_category on yueshu_website_blog.blog_category_id = yueshu_website_blog_category.id
        where title like "%"#{title}"%"
        ?{author != null, and yueshu_website_blog.author like "%"#{author}"%"}
        ?{publish != null, and yueshu_website_blog.publish = #{publish}}
        order by yueshu_website_blog.publish_time desc 
    """)
} else if (author) {
    blogs = db.camel().page("""
        select yueshu_website_blog.*, yueshu_website_blog_category.name as category_name from yueshu_website_blog
        left join yueshu_website_blog_category on yueshu_website_blog.blog_category_id = yueshu_website_blog_category.id
        where author like "%"#{author}"%"
        ?{publish != null, and yueshu_website_blog.publish = #{publish}}
        order by yueshu_website_blog.publish_time desc 
    """)
} else if (publish != null) {
    blogs = db.camel().page("""
        select yueshu_website_blog.*, yueshu_website_blog_category.name as category_name from yueshu_website_blog
        left join yueshu_website_blog_category on yueshu_website_blog.blog_category_id = yueshu_website_blog_category.id
        where yueshu_website_blog.publish = #{publish}
        order by yueshu_website_blog.publish_time desc 
    """)
} else {
        blogs = db.camel().page("""
        select yueshu_website_blog.*, yueshu_website_blog_category.name as category_name from yueshu_website_blog
        left join yueshu_website_blog_category on yueshu_website_blog.blog_category_id = yueshu_website_blog_category.id
        order by yueshu_website_blog.publish_time desc 
    """)
}

blogs.list = blogs.list || []
 blogs.list.map(blog => {
    var tags = db.camel().select(
        """
        select * from yueshu_website_blog_tag a1 left join yueshu_website_blog_tag_join a2
        on a1.id = a2.tag_id
        where a2.blog_id = #{blog.id}
        """
    )
    blog.tags = tags
})

return blogs;