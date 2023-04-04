{
  "properties" : { },
  "id" : "740950a67ad2457aa8282166f3415365",
  "script" : null,
  "groupId" : "41effd1b089f433686b8f4242d4247ac",
  "name" : "category",
  "createTime" : null,
  "updateTime" : 1680574449337,
  "lock" : null,
  "createBy" : "admin",
  "updateBy" : "admin",
  "path" : "/categoryList",
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
    select * from yueshu_website_partner_category
    """
)