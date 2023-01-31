{
  "properties" : { },
  "id" : "6e0e47e8cfb042b085a9fc0c62b4b57f",
  "script" : null,
  "groupId" : "96a0eee7dd8f4da2a65a69307c3ac4d9",
  "name" : "createBlog",
  "createTime" : null,
  "updateTime" : 1660899305452,
  "lock" : null,
  "createBy" : null,
  "updateBy" : "admin",
  "path" : "/createBlog",
  "method" : "POST",
  "parameters" : [ ],
  "options" : [ ],
  "requestBody" : "{\n  \"title\": \"D3.js 力导向图的显示优化\",\n  \"date\": \"2020-04-29 00:00:00\",\n  \"description\": \"我们用 D3.js 力导向图对数据关系进行分析，其节点和关系线直观地体现图数据库的数据关系，还支持关联相对应的图数据库语句完成拓展查询。本文着重讲解如何优化新增节点和多边关系的显示\",\n  \"tags\": [ \"周边工具\", \"开发日志\" ],\n  \"author\": \"Nico\",\n  \"content\": \"\\n![d3](https://www-cdn.nebula-graph.com.cn/nebula-blog/d303.jpeg)\\n\\n## D3.js \\n\\n作为一个前端，说到可视化除了听过 [D3.js](https://d3js.org/) 的大名，常见的可视化库还有 [ECharts](https://echarts.apache.org/examples/zh/index.html)、[Chart.js](http://chartjs.cn/)，这两个库功能也很强大，但是有一个共同特点是**封装层次高**，留给开发者可设计和控制的部分太少。和 EChart、Chart.js 等相比，D3.js **相对来说自由度会高很多**，得益于 D3.js 中 **SVG 画图对事件处理器的支持**，D3.js 可将任意数据绑定到文档对象模型（DOM）上，也可以直接操作对象模型（DOM）完成 [W3C DOM API](https://www.w3.org/DOM/DOMTR) 相关操作，对于想要展示自己设计图形的开发者，D3.js 绝对是一个不错的选择。\\n\\n## d3-force 力导向图\\n\\n拿实现一个关系网为例，d3-force 力导向图是不二的选择。\\n\\n[d3-force](https://d3js.org.cn/document/d3-force/#installing) 是 D3.js 实现以模拟粒子物理运动的 [velocity Verlet](https://en.wikipedia.org/wiki/Verlet_integration) 数值积分器的模块，可用来控制粒子和边秩序。在[力导向图](https://d3js.org.cn/document/d3-force/#installing)中，d3-force 中的每个节点都可以看成是一个放电粒子，粒子间存在某种斥力（库仑斥力）。同时，这些粒子间被它们之间的“边”所牵连，从而产生牵引力。\\n\\n在 d3-force 中，粒子在斥力和牵引力的作用下，从随机无序的初态不断发生位移，逐渐趋于平衡有序。整个图只有点 / 边，图形实现[官方样例](https://observablehq.com/collection/@d3/d3-force)较少且自定义样式居多。\\n\\n下图就是最简单的关系网图，想要实现自己想要的关系网图，采用 D3.js 是个不错的选择。\\n\\n![d3-force](https://www-cdn.nebula-graph.com.cn/nebula-blog/d302.png)\\n\\n## 构建 D3.js 力导向图\\n\\n在这里的实践过程中，我们用 D3.js 力导向图来对图数据库的数据关系进行分析：其节点和关系线直观地体现出图数据库的数据关系，且支持关联对应查询语句完成拓展查询。进阶来说，可通过对文档对象模型（DOM）的直接操作同步数据库进而更新数据，当然操作这个比较复杂，😂 不在本文中详细讲述。\\n\\n下面，我们来实现一个简单的力导向图，初窥 D3.js 对数据分析的作用和显示优化的一些思路。首先我们创建一个力导向图：\\n\\n```\\nthis.force = d3\\n        .forceSimulation()\\n        // 为节点分配坐标\\n        .nodes(data.vertexes)\\n        // 连接线\\n        .force('link', linkForce)\\n        // 整个实例中心\\n        .force('center', d3.forceCenter(width / 2, height / 2))\\n        // 引力\\n        .force('charge', d3.forceManyBody().strength(-20))\\n        // 碰撞力 防止节点重叠\\n        .force('collide',d3.forceCollide().radius(60).iterations(2));\\n```\\n\\n通过上述代码，我们可以得到下面这样一个可视化的节点和关系图。\\n\\n![vertex-relation](https://www-cdn.nebula-graph.com.cn/nebula-blog/d303.png)\\n\\n### 实现拓展查询显示优化\\n\\n看到关系图（上图），我们会发现有一个新需求：**选中节点继续往下拓展查询**。为了实现拓展查询，在这里笔者要介绍下 D3.js 自带 API。\\n\\nD3.js 的 [enter()](https://www.d3js.org.cn/#enter%E5%92%8Cexit%E6%93%8D%E4%BD%9C) API 可对新增的节点作单独的逻辑处理，所以当拓展查询到新的节点 push 进节点数组时，不会去改变之前存在的节点信息（包括 x，y 坐标)，而是按照 d3-force 实例分配的坐标进行渲染。从 API 角度来理解，这样处理没问题，但对 d3-force 中已存在的实例来说，新增的节点不是一个简单的 push 就能处理的。因为 [d3.forceSimulation()](https://github.com/d3/d3-force/blob/master/src/simulation.js)  这个模型给当前节点分配的位置坐标（x，y）是随机，目前看来这样操作没什么问题，对不对？\\n\\n但由于 `d3.forceSimulation().node()` 坐标随机分配导致了图形拓展出来位置的随机出现，在之前 d3-force 实例中我们设定好的 collide（碰撞力）和 links （引力）参数作用下，和新节点相关联的节点受到牵引力影响互相靠近，在靠近的过程中又会和其他节点发生碰撞。当力导图已存在节点的情况下，这些新增节点出现时会让整个力导向图在 collide 和 links 的作用下不停地碰撞，进行牵引，直到每个节点都找到自己合适的位置，即碰撞力和牵引力都满足要求时才停止移动，看看下图，像不像宇宙大爆炸 🌞。\\n\\n![d3](https://www-cdn.nebula-graph.com.cn/nebula-blog/d304.gif)\\n\\n上述无序到有序熵减的过程，站在用户角度，每新增一个节点导致整个力导图的运动，除了有一种抽搐感，停止图形变化又需要长时间的等待，这是不能接受的。可 D3.js API [enter()](https://www.d3js.org.cn/#enter%E5%92%8Cexit%E6%93%8D%E4%BD%9C) 又是这样定义的，难道新增的节点和之前的节点的呈现处理需要开发者分开单独处理吗？如果是分开单独处理，每次节点渲染都要遍历判断是不是新增，在节点较多时反而更影响性能？那么如何优化这个新增节点呈现的问题呢？\\n\\n网上解决新增节点呈现问题，大多采用减小 d3-force 实例 collide，增大 links 的 distance 参数值，这样会让节点很快地找到平衡点从而使整个力导图稳定下来，这确实是一个好办法。但是这样节点之间的连线长度相差明显，而且图形整体偏大，对于大数据量的 case 来说，这种显示方式并不太适合。\\n\\n基于上述的方法，笔者有了另一种解决思路——**保证新增节点是在该选中拓展的节点周围**，也就是说直接把新增节点的坐标设置为对应选择拓展节点一样的 x,y 坐标而不用 D3 .forceSimulation().node() 分配，这样利用 d3-force 这个实例的节点碰撞力，保证新增节点的出现都不会覆盖，最终会在选中拓展节点周围出现。 这样处理虽然还是对新增节点小的范围内的节点有影响，但相对来说，不会大幅度地影响整个关系图形走势。关键代码如下：\\n\\n```\\n# 给新增的坐标设置为拓展起点中心或整个图中心\\naddVertexes.map(d => {\\n  d.x = _.meanBy(selectVertexes, 'x') || svg.style('width') / 2;\\n  d.y = _.meanBy(selectVertexes, 'y') || svg.style('heigth') / 2;\\n});\\n```\\n\\n如果没有选中节点（即添加起点）则该起点坐标位置就在图中心位置，对已存在的节点来说，影响程度会小很多，这还是一个很不错的思路，这个解决办法可以推荐一下。\\n\\n除了新增节点的呈现问题，整个图形的呈现还有另外一个问题：**两点之间多边显示的优化处理**。\\n\\n### 两点之间多边显示的优化处理\\n\\n> 当两个节点之间存在多条边关系时，默认连接线是直线的情况下肯定会出现多线覆盖。因此曲线连接便成了我们的另外需要解决的问题。\\n> 曲线如何定义弯曲度保证两点之间的多条线不会交互覆盖呢？在多条线弯曲下，如何平均半圆弧弯曲避免全跑到某半圆弧上？定义曲线弧方向？\\n\\n上述问题都是下一步需要解决的问题，其实问题的解决方法也不少。目前笔者采用了先统计下两点之间的线条数，再将这些连接线分配到一个 map 里，两个节点的 name 字段进行拼接做成 key，这样计算得到两点之间的连接线总数。\\n\\n然后在遍历时同 map 的线根据方向分成正向、反向两组，正向组遍历给每条线追加设置一个 linknum 编号，同理，反向组遍历追加一个 -linknum 编号值。这个正向、反向判断方法很多，笔者是根据节点 source.name、target.name 进行比较，btw，这里其实是比较 ASCII 码。定义连接线的正反方向办法太多了，用两点之间的任意固定字段比较即可，在这里不做赘述。而我们设定的 linknum 值就是来确定该条弧线的弯曲度和弯曲方向的，这里搭配下面代码讲解比较好理解：\\n\\n```\\n  const linkGroup = {};\\n  // 两点之间的线根据两点的 name 属性设置为同一个 key，加入到 linkGroup 中，给两点之间的所有边分成一个组\\n  edges.forEach((link: any) => {\\n    const key =\\n      link.source.name < link.target.name\\n        ? link.source.name + ':' + link.target.name\\n        : link.target.name + ':' + link.source.name;\\n    if (!linkGroup.hasOwnProperty(key)) {\\n      linkGroup[key] = [];\\n    }\\n    linkGroup[key].push(link);\\n  });\\n  // 遍历给每组去调用 setLinkNumbers 来分配 linkum\\n  edges.forEach((link: any) => {\\n    const key = setLinkName(link);\\n    link.size = linkGroup[key].length;\\n    const group = linkGroup[key];\\n    const keyPair = key.split(':');\\n    let type = 'noself';\\n    if (keyPair[0] === keyPair[1]) {\\n      type = 'self';\\n    }\\n    setLinkNumbers(group, type);\\n  });\\n```\\n\\n```\\n#根据不同方向分为 linkA，linkB 两个数组，分别分配两种 linknum，从而控制上下椭圆弧\\nexport function setLinkNumbers(group) {\\n  const len = group.length;\\n  const linksA: any = [];\\n  const linksB: any = [];\\n  for (let i = 0; i < len; i++) {\\n    const link = group[i];\\n    if (link.source.name < link.target.name) {\\n      linksA.push(link);\\n    } else {\\n      linksB.push(link);\\n    }\\n  }\\n  let startLinkANumber = 1;\\n  linksA.forEach(linkA=> {\\n    linkA.linknum = startLinkANumber++;\\n  }\\n  let startLinkBNumber = -1;\\n  linksB.forEach(linkB=> {\\n    linkB.linknum = startLinkBNumber--;\\n  }\\n}\\n```\\n\\n按照我们上面描述的思路，给每条连接线分配 linknum 值后，接着在实现监听连接线的的 tick 事件函数里面判断 linknum 正负数判断设置 [path 路径的弯曲度和方向](https://www.w3school.com.cn/svg/svg_path.asp) 就行了，最终效果如下图\\n\\n![nebula-studio](https://www-cdn.nebula-graph.com.cn/nebula-blog/d305.png)\\n\\n## 结语\\n\\n好了，以上便是笔者使用 D3.js 力导向图实现关系网的优化思路和方法。其实要构建一个复杂的关系网，需要考虑的问题很多，需要优化的地方也很多，今天给大家分享两个最容易遇到的新节点呈现、多边处理问题，后续我们会继续产出 D3.js 优化系列文，欢迎订阅 Nebula Graph 博客。\\n\\n最后，你可以通过访问图数据库 Nebula Graph Studio：[Nebula-Graph-Studio](https://docs.nebula-graph.com.cn/2.0.1/nebula-studio/deploy-connect/st-ug-deploy/)，体验下 D3.js 是如何呈现关系的。本文中如有任何错误或疏漏欢迎去 GitHub：[https://github.com/vesoft-inc/nebula](https://github.com/vesoft-inc/nebula) issue 区向我们提 issue 或者前往官方论坛：[https://discuss.nebula-graph.com.cn/](https://discuss.nebula-graph.com.cn/) 的 `建议反馈` 分类下提建议 👏；交流图数据库技术？加入 Nebula 交流群请先[填写下你的 Nebula 名片](https://wj.qq.com/s2/8321168/8e2f/)，Nebula 小助手会拉你进群~~\\n\\n\\n> 作者有话说：Hi，我是 Nico，是 Nebula Graph 的前端工程师，对数据可视化比较感兴趣，分享一些自己的实践心得，希望这次分享能给大家带来帮助，如有不当之处，欢迎帮忙纠正，谢谢~\\n\\n\",\n  \"pic\": \"https://www-cdn.nebula-graph.com.cn/nebula-blog/d302.png\",\n  \"slug\": \"d3-force-layout-optimization\",\n  \"publish\": 1\n}",
  "headers" : [ ],
  "paths" : [ ],
  "responseBody" : "{\n    \"code\": 0,\n    \"message\": \"success\",\n    \"data\": 203,\n    \"timestamp\": 1660119698888,\n    \"executeTime\": 40\n}",
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
      "value" : "D3.js 力导向图的显示优化",
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
      "value" : "2020-04-29 00:00:00",
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
      "value" : "我们用 D3.js 力导向图对数据关系进行分析，其节点和关系线直观地体现图数据库的数据关系，还支持关联相对应的图数据库语句完成拓展查询。本文着重讲解如何优化新增节点和多边关系的显示",
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
        "value" : "周边工具",
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
      "value" : "Nico",
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
      "value" : "\\n![d3](https://www-cdn.nebula-graph.com.cn/nebula-blog/d303.jpeg)\\n\\n## D3.js \\n\\n作为一个前端，说到可视化除了听过 [D3.js](https://d3js.org/) 的大名，常见的可视化库还有 [ECharts](https://echarts.apache.org/examples/zh/index.html)、[Chart.js](http://chartjs.cn/)，这两个库功能也很强大，但是有一个共同特点是**封装层次高**，留给开发者可设计和控制的部分太少。和 EChart、Chart.js 等相比，D3.js **相对来说自由度会高很多**，得益于 D3.js 中 **SVG 画图对事件处理器的支持**，D3.js 可将任意数据绑定到文档对象模型（DOM）上，也可以直接操作对象模型（DOM）完成 [W3C DOM API](https://www.w3.org/DOM/DOMTR) 相关操作，对于想要展示自己设计图形的开发者，D3.js 绝对是一个不错的选择。\\n\\n## d3-force 力导向图\\n\\n拿实现一个关系网为例，d3-force 力导向图是不二的选择。\\n\\n[d3-force](https://d3js.org.cn/document/d3-force/#installing) 是 D3.js 实现以模拟粒子物理运动的 [velocity Verlet](https://en.wikipedia.org/wiki/Verlet_integration) 数值积分器的模块，可用来控制粒子和边秩序。在[力导向图](https://d3js.org.cn/document/d3-force/#installing)中，d3-force 中的每个节点都可以看成是一个放电粒子，粒子间存在某种斥力（库仑斥力）。同时，这些粒子间被它们之间的“边”所牵连，从而产生牵引力。\\n\\n在 d3-force 中，粒子在斥力和牵引力的作用下，从随机无序的初态不断发生位移，逐渐趋于平衡有序。整个图只有点 / 边，图形实现[官方样例](https://observablehq.com/collection/@d3/d3-force)较少且自定义样式居多。\\n\\n下图就是最简单的关系网图，想要实现自己想要的关系网图，采用 D3.js 是个不错的选择。\\n\\n![d3-force](https://www-cdn.nebula-graph.com.cn/nebula-blog/d302.png)\\n\\n## 构建 D3.js 力导向图\\n\\n在这里的实践过程中，我们用 D3.js 力导向图来对图数据库的数据关系进行分析：其节点和关系线直观地体现出图数据库的数据关系，且支持关联对应查询语句完成拓展查询。进阶来说，可通过对文档对象模型（DOM）的直接操作同步数据库进而更新数据，当然操作这个比较复杂，😂 不在本文中详细讲述。\\n\\n下面，我们来实现一个简单的力导向图，初窥 D3.js 对数据分析的作用和显示优化的一些思路。首先我们创建一个力导向图：\\n\\n```\\nthis.force = d3\\n        .forceSimulation()\\n        // 为节点分配坐标\\n        .nodes(data.vertexes)\\n        // 连接线\\n        .force('link', linkForce)\\n        // 整个实例中心\\n        .force('center', d3.forceCenter(width / 2, height / 2))\\n        // 引力\\n        .force('charge', d3.forceManyBody().strength(-20))\\n        // 碰撞力 防止节点重叠\\n        .force('collide',d3.forceCollide().radius(60).iterations(2));\\n```\\n\\n通过上述代码，我们可以得到下面这样一个可视化的节点和关系图。\\n\\n![vertex-relation](https://www-cdn.nebula-graph.com.cn/nebula-blog/d303.png)\\n\\n### 实现拓展查询显示优化\\n\\n看到关系图（上图），我们会发现有一个新需求：**选中节点继续往下拓展查询**。为了实现拓展查询，在这里笔者要介绍下 D3.js 自带 API。\\n\\nD3.js 的 [enter()](https://www.d3js.org.cn/#enter%E5%92%8Cexit%E6%93%8D%E4%BD%9C) API 可对新增的节点作单独的逻辑处理，所以当拓展查询到新的节点 push 进节点数组时，不会去改变之前存在的节点信息（包括 x，y 坐标)，而是按照 d3-force 实例分配的坐标进行渲染。从 API 角度来理解，这样处理没问题，但对 d3-force 中已存在的实例来说，新增的节点不是一个简单的 push 就能处理的。因为 [d3.forceSimulation()](https://github.com/d3/d3-force/blob/master/src/simulation.js)  这个模型给当前节点分配的位置坐标（x，y）是随机，目前看来这样操作没什么问题，对不对？\\n\\n但由于 `d3.forceSimulation().node()` 坐标随机分配导致了图形拓展出来位置的随机出现，在之前 d3-force 实例中我们设定好的 collide（碰撞力）和 links （引力）参数作用下，和新节点相关联的节点受到牵引力影响互相靠近，在靠近的过程中又会和其他节点发生碰撞。当力导图已存在节点的情况下，这些新增节点出现时会让整个力导向图在 collide 和 links 的作用下不停地碰撞，进行牵引，直到每个节点都找到自己合适的位置，即碰撞力和牵引力都满足要求时才停止移动，看看下图，像不像宇宙大爆炸 🌞。\\n\\n![d3](https://www-cdn.nebula-graph.com.cn/nebula-blog/d304.gif)\\n\\n上述无序到有序熵减的过程，站在用户角度，每新增一个节点导致整个力导图的运动，除了有一种抽搐感，停止图形变化又需要长时间的等待，这是不能接受的。可 D3.js API [enter()](https://www.d3js.org.cn/#enter%E5%92%8Cexit%E6%93%8D%E4%BD%9C) 又是这样定义的，难道新增的节点和之前的节点的呈现处理需要开发者分开单独处理吗？如果是分开单独处理，每次节点渲染都要遍历判断是不是新增，在节点较多时反而更影响性能？那么如何优化这个新增节点呈现的问题呢？\\n\\n网上解决新增节点呈现问题，大多采用减小 d3-force 实例 collide，增大 links 的 distance 参数值，这样会让节点很快地找到平衡点从而使整个力导图稳定下来，这确实是一个好办法。但是这样节点之间的连线长度相差明显，而且图形整体偏大，对于大数据量的 case 来说，这种显示方式并不太适合。\\n\\n基于上述的方法，笔者有了另一种解决思路——**保证新增节点是在该选中拓展的节点周围**，也就是说直接把新增节点的坐标设置为对应选择拓展节点一样的 x,y 坐标而不用 D3 .forceSimulation().node() 分配，这样利用 d3-force 这个实例的节点碰撞力，保证新增节点的出现都不会覆盖，最终会在选中拓展节点周围出现。 这样处理虽然还是对新增节点小的范围内的节点有影响，但相对来说，不会大幅度地影响整个关系图形走势。关键代码如下：\\n\\n```\\n# 给新增的坐标设置为拓展起点中心或整个图中心\\naddVertexes.map(d => {\\n  d.x = _.meanBy(selectVertexes, 'x') || svg.style('width') / 2;\\n  d.y = _.meanBy(selectVertexes, 'y') || svg.style('heigth') / 2;\\n});\\n```\\n\\n如果没有选中节点（即添加起点）则该起点坐标位置就在图中心位置，对已存在的节点来说，影响程度会小很多，这还是一个很不错的思路，这个解决办法可以推荐一下。\\n\\n除了新增节点的呈现问题，整个图形的呈现还有另外一个问题：**两点之间多边显示的优化处理**。\\n\\n### 两点之间多边显示的优化处理\\n\\n> 当两个节点之间存在多条边关系时，默认连接线是直线的情况下肯定会出现多线覆盖。因此曲线连接便成了我们的另外需要解决的问题。\\n> 曲线如何定义弯曲度保证两点之间的多条线不会交互覆盖呢？在多条线弯曲下，如何平均半圆弧弯曲避免全跑到某半圆弧上？定义曲线弧方向？\\n\\n上述问题都是下一步需要解决的问题，其实问题的解决方法也不少。目前笔者采用了先统计下两点之间的线条数，再将这些连接线分配到一个 map 里，两个节点的 name 字段进行拼接做成 key，这样计算得到两点之间的连接线总数。\\n\\n然后在遍历时同 map 的线根据方向分成正向、反向两组，正向组遍历给每条线追加设置一个 linknum 编号，同理，反向组遍历追加一个 -linknum 编号值。这个正向、反向判断方法很多，笔者是根据节点 source.name、target.name 进行比较，btw，这里其实是比较 ASCII 码。定义连接线的正反方向办法太多了，用两点之间的任意固定字段比较即可，在这里不做赘述。而我们设定的 linknum 值就是来确定该条弧线的弯曲度和弯曲方向的，这里搭配下面代码讲解比较好理解：\\n\\n```\\n  const linkGroup = {};\\n  // 两点之间的线根据两点的 name 属性设置为同一个 key，加入到 linkGroup 中，给两点之间的所有边分成一个组\\n  edges.forEach((link: any) => {\\n    const key =\\n      link.source.name < link.target.name\\n        ? link.source.name + ':' + link.target.name\\n        : link.target.name + ':' + link.source.name;\\n    if (!linkGroup.hasOwnProperty(key)) {\\n      linkGroup[key] = [];\\n    }\\n    linkGroup[key].push(link);\\n  });\\n  // 遍历给每组去调用 setLinkNumbers 来分配 linkum\\n  edges.forEach((link: any) => {\\n    const key = setLinkName(link);\\n    link.size = linkGroup[key].length;\\n    const group = linkGroup[key];\\n    const keyPair = key.split(':');\\n    let type = 'noself';\\n    if (keyPair[0] === keyPair[1]) {\\n      type = 'self';\\n    }\\n    setLinkNumbers(group, type);\\n  });\\n```\\n\\n```\\n#根据不同方向分为 linkA，linkB 两个数组，分别分配两种 linknum，从而控制上下椭圆弧\\nexport function setLinkNumbers(group) {\\n  const len = group.length;\\n  const linksA: any = [];\\n  const linksB: any = [];\\n  for (let i = 0; i < len; i++) {\\n    const link = group[i];\\n    if (link.source.name < link.target.name) {\\n      linksA.push(link);\\n    } else {\\n      linksB.push(link);\\n    }\\n  }\\n  let startLinkANumber = 1;\\n  linksA.forEach(linkA=> {\\n    linkA.linknum = startLinkANumber++;\\n  }\\n  let startLinkBNumber = -1;\\n  linksB.forEach(linkB=> {\\n    linkB.linknum = startLinkBNumber--;\\n  }\\n}\\n```\\n\\n按照我们上面描述的思路，给每条连接线分配 linknum 值后，接着在实现监听连接线的的 tick 事件函数里面判断 linknum 正负数判断设置 [path 路径的弯曲度和方向](https://www.w3school.com.cn/svg/svg_path.asp) 就行了，最终效果如下图\\n\\n![nebula-studio](https://www-cdn.nebula-graph.com.cn/nebula-blog/d305.png)\\n\\n## 结语\\n\\n好了，以上便是笔者使用 D3.js 力导向图实现关系网的优化思路和方法。其实要构建一个复杂的关系网，需要考虑的问题很多，需要优化的地方也很多，今天给大家分享两个最容易遇到的新节点呈现、多边处理问题，后续我们会继续产出 D3.js 优化系列文，欢迎订阅 Nebula Graph 博客。\\n\\n最后，你可以通过访问图数据库 Nebula Graph Studio：[Nebula-Graph-Studio](https://docs.nebula-graph.com.cn/2.0.1/nebula-studio/deploy-connect/st-ug-deploy/)，体验下 D3.js 是如何呈现关系的。本文中如有任何错误或疏漏欢迎去 GitHub：[https://github.com/vesoft-inc/nebula](https://github.com/vesoft-inc/nebula) issue 区向我们提 issue 或者前往官方论坛：[https://discuss.nebula-graph.com.cn/](https://discuss.nebula-graph.com.cn/) 的 `建议反馈` 分类下提建议 👏；交流图数据库技术？加入 Nebula 交流群请先[填写下你的 Nebula 名片](https://wj.qq.com/s2/8321168/8e2f/)，Nebula 小助手会拉你进群~~\\n\\n\\n> 作者有话说：Hi，我是 Nico，是 Nebula Graph 的前端工程师，对数据可视化比较感兴趣，分享一些自己的实践心得，希望这次分享能给大家带来帮助，如有不当之处，欢迎帮忙纠正，谢谢~\\n\\n",
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
      "value" : "https://www-cdn.nebula-graph.com.cn/nebula-blog/d302.png",
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
      "value" : "d3-force-layout-optimization",
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
      "value" : "203",
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
      "value" : "1660119698888",
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
      "value" : "40",
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
    var blogId
    if (body.id) {
        blogId = db.update(
        """
        insert into website_blog (id, create_time,update_time,author,content,description,pic,publish,slug,title,create_user_id,update_user_id,blog_category_id) 
        values (
            #{body.id}
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
    } else {
        blogId = db.insert(
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
    }
    if (body.tags != null && body.tags.length > 0) {
        body.tags.map(tag => {
            var exitsTag = db.selectOne(
                """
                select * from website_blog_tag where name = #{tag}
                """)
            if (exitsTag) {
                db.insert(
                    """
                    insert into website_blog_tag_join (blog_id, tag_id) values (#{blogId}, #{exitsTag.id})
                    """
                )
            } else {
                var newTagId = db.insert(
                    """
                    insert into website_blog_tag (name) values (#{tag})
                    """
                )
                db.insert(
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


    