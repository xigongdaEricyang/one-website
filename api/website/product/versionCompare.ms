{
  "properties" : { },
  "id" : "05b2ea2eb8704e9aaa380ea595623d3a",
  "script" : null,
  "groupId" : "030e589d0efb4a70b62a3b91dc87c2d1",
  "name" : "versionCompare",
  "createTime" : null,
  "updateTime" : 1660202679595,
  "lock" : null,
  "createBy" : null,
  "updateBy" : "admin",
  "path" : "/versionCompare",
  "method" : "GET",
  "parameters" : [ {
    "name" : "key",
    "value" : "dashboard",
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
  "responseBody" : "{\n    \"code\": -1,\n    \"message\": \"系统内部出现错误\",\n    \"data\": null,\n    \"timestamp\": 1660202663227,\n    \"executeTime\": 30\n}",
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
      "dataType" : "Array",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    }, {
      "name" : "timestamp",
      "value" : "1660202663227",
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
      "value" : "30",
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

var functionCategory = db.camel().select(
    """
    select a1.* from website_function_category a1 left join website_product_category a2 on a1.  product_category_id = a2.id ?{key != null && key.length() > 0,  where a2.primary_key = #{key}}
    """
)

if (functionCategory) {
    functionCategory.map(functionItem => {
        var items = db.camel().select(
        """
        select * from website_product_version where function_id = #{functionItem.id}
        """
        )
        var productCategory = db.camel().selectOne(
            """
            select * from website_product_category where id = #{functionItem.productCategoryId}
            """
        )
        functionItem.items = items
        functionItem.productCategory = productCategory
    })
}

return functionCategory;