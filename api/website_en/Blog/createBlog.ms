{
  "properties" : { },
  "id" : "47a42d6664b84bc184783591a60d470c",
  "script" : null,
  "groupId" : "43ae7ed0e6b94cc085570668c6c90523",
  "name" : "createBlog",
  "createTime" : null,
  "updateTime" : 1660121736546,
  "lock" : null,
  "createBy" : null,
  "updateBy" : "admin",
  "path" : "/createBlog",
  "method" : "POST",
  "parameters" : [ ],
  "options" : [ ],
  "requestBody" : "{\n  \"title\": \"Hands-On Experience: Import Data to Nebula Graph with Spark\",\n  \"date\": \"2020-12-01 00:00:00\",\n  \"description\": \"This article is written by Liu Jiahao, an engineer at the big data team of IntSig Information Co. Ltd (IntSig). He has been playing around with Nebula Graph and is one of our proud GitHub contributors. This post shares his experience importing data to Nebula Graph with Spark.\",\n  \"tags\": [ \"user-review\" ],\n  \"author\": \"Liu Jiahao\",\n  \"content\": \"\",\n  \"pic\": \"https://user-images.githubusercontent.com/57335825/100715636-54f8ad00-336c-11eb-8493-872f2d782195.png\",\n  \"slug\": \"best-practices-import-data-spark-nebula-graph\",\n  \"publish\": 1\n}",
  "headers" : [ ],
  "paths" : [ ],
  "responseBody" : "{\n    \"code\": 0,\n    \"message\": \"success\",\n    \"data\": \"导入失败\",\n    \"timestamp\": 1660120379522,\n    \"executeTime\": 19\n}",
  "description" : null,
  "requestBodyDefinition" : {
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
      "name" : "title",
      "value" : "Hands-On Experience: Import Data to Nebula Graph with Spark",
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
      "name" : "date",
      "value" : "2020-12-01 00:00:00",
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
      "value" : "This article is written by Liu Jiahao, an engineer at the big data team of IntSig Information Co. Ltd (IntSig). He has been playing around with Nebula Graph and is one of our proud GitHub contributors. This post shares his experience importing data to Nebula Graph with Spark.",
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
      "children" : [ {
        "name" : "",
        "value" : "user-review",
        "description" : "",
        "required" : false,
        "dataType" : "String",
        "type" : null,
        "defaultValue" : null,
        "validateType" : "",
        "error" : "",
        "expression" : "",
        "children" : [ ]
      } ]
    }, {
      "name" : "author",
      "value" : "Liu Jiahao",
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
      "value" : "",
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
      "value" : "https://user-images.githubusercontent.com/57335825/100715636-54f8ad00-336c-11eb-8493-872f2d782195.png",
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
      "name" : "slug",
      "value" : "best-practices-import-data-spark-nebula-graph",
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
      "value" : "导入失败",
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
      "value" : "1660120379522",
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
      "value" : "19",
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
var tx = db.transaction()

try {
    var blogId = db.one_website_en.insert(
        """
        insert into website_blog (create_time,update_time,author,content,description,pic,publish,slug,title,create_user_id,update_user_id,blog_category_id) 
        values (
            #{body.date}, 
            #{body.date}, 
            #{body.author}, 
            #{body.content},
            #{body.description}, 
            #{body.pic}, 
            #{body.publish},
            #{body.slug},
            #{body.title},
            1,
            1,
            1)
        """
    )

    if (body.tags != null && body.tags.length > 0) {
        body.tags.map(tag => {
            var exitsTag = db.one_website_en.selectOne(
                """
                select * from website_blog_tag where name = #{tag}
                """)
            if (exitsTag) {
                db.one_website_en.insert(
                    """
                    insert into website_blog_tag_join (blog_id, tag_id) values (#{blogId}, #{exitsTag.id})
                    """
                )
            } else {
                var newTagId = db.one_website_en.insert(
                    """
                    insert into website_blog_tag (name) values (#{tag})
                    """
                )
                db.one_website_en.insert(
                    """
                    insert into website_blog_tag_join (blog_id, tag_id) values (#{blogId}, #{newTagId})
                    """
                )
            }
        })
    }
    tx.commit()
    return blogId
} catch(e) {
    tx.rollback()
    return '导入失败'
}


    