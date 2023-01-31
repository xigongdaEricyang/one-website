{
  "properties" : { },
  "id" : "8ee1f614970f48699022476cceb530e3",
  "script" : null,
  "groupId" : "3f3baa5cfe9c47ee9b61d2928e385a07",
  "name" : "category",
  "createTime" : null,
  "updateTime" : 1658987709274,
  "lock" : null,
  "createBy" : null,
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
    select * from website_partner_category
    """
)