import axios from 'axios';
import { curLanguage, Language } from '@/utils';

export const DEFAULT_PAGE_SIZE = 10;

const Authorization = "Bearer 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";

const getEntity = (entity: string) => {
  return curLanguage === Language.ZH_CN ? entity : `${entity}EN`;
}

const workflowBaseUrl = 'https://api.github.com/repos/vesoft-inc/nebula-website/actions/workflows';

const getHost = () => {
  const { protocol, hostname } = location;
  if (hostname === 'localhost' || hostname === '127.0.0.1') {
    return 'http://192.168.8.116:8080'
  }
  let curProtocol = protocol.includes('https') ? 'https' : 'http';
  return `${curProtocol}://${hostname}`;
}

const getWebsiteSuffix = () => {
  return curLanguage === Language.ZH_CN ? 'website' : 'website_en'
}

export const asyncCreateBlog = async (data) => {
  const entity = getEntity('Blog');
  const res = await axios.post(
    `/erupt-api/data/modify/${entity}`,
    {
      ...data,
    },
    {
      headers: {
        token: (parent as any).getAppToken().token,
        erupt: entity
      },
    });

  return res;
}

export const asyncEditBlog = async (data) => {
  const entity = getEntity('Blog');
  const res = await axios.put(
    `/erupt-api/data/modify/${entity}`,
    {
      ...data,
    },
    {
      headers: {
        token: (parent as any).getAppToken().token,
        erupt: entity
      },
    });

  return res;
}

export const asyncFetchBlogs = async (pageIndex: number) => {
  const res = await axios.get(
    `${getHost()}/${getWebsiteSuffix()}/blog/list`,
    {
      params: {
        page: pageIndex,
        pageSize: DEFAULT_PAGE_SIZE,
      }
    }
    );
  if (res.status === 200) {
    return res.data.data;
  }
  return {
    list: [],
    total: 0
  };
}

export const asyncFetchBlogById = async (blogId: number) => {
  const entity = getEntity('Blog');
  const res = await axios.get(
    `/erupt-api/data/${entity}/${blogId}`,
    {
      headers: {
        token: (parent as any).getAppToken().token,
        erupt: entity
      },
    });
  if (res.status === 200) {
    return res.data;
  }
  return {
    list: [],
    total: 0
  };
}

export const asyncFetchBlogBySlug = async (slug: string) =>  {
  const res = await axios.get(
    `${getHost()}/${getWebsiteSuffix()}/blog/findBySlug`,
    {
      params: {
        slug,
      }
    }
    );
  if (res.status === 200) {
    return res.data.data;
  }
}

export const asyncDeleteBlogById = async (id: number) => {
  const entity = getEntity('Blog');
  const res = await axios.delete(
    `/erupt-api/data/modify/${entity}/${id}`,
    {
      headers: {
        token: (parent as any).getAppToken().token,
        erupt: entity
      },
    });

  return res;
}

export const asyncFetchBlogCategorys = async () => {
  const entity = getEntity('BlogCategory');
  const res = await axios.post(
    `/erupt-api/data/table/${entity}`,
    {
      pageIndex: 1,
      pageSize: 200,
      sort: 'id'
    },
    {
      headers: {
        token: (parent as any).getAppToken().token,
        erupt: entity
      },
    });

  if (res.status === 200) {
    return res.data;
  }
  return {
    list: [],
    total: 0
  };
}

export const asyncFetchBlogTags = async () => {
  const entity = getEntity('BlogTag');
  const res = await axios.post(
    `/erupt-api/data/table/${entity}`,
    {
      pageIndex: 1,
      pageSize: 200,
      sort: ''
    },
    {
      headers: {
        token: (parent as any).getAppToken().token,
        erupt: entity
      },
    });

  if (res.status === 200) {
    return res.data;
  }
  return {
    list: [],
    total: 0
  };
}

export const asyncSearchBlogList = async (data, pageIndex) => {
  const res = await axios.get(
    `${getHost()}/${getWebsiteSuffix()}/blog/list`,
    {
      params: {
        page: pageIndex,
        pageSize: DEFAULT_PAGE_SIZE,
        ...data
      },
    }
  )
  return res.data;
}

export const asyncFetchWorkflows = async () => {
  const res = await axios.get(
    workflowBaseUrl,
    {
      headers: {
        Accept: "application/vnd.github+json",
        Authorization,
      }
    }
  )
  if (res.status === 200) {
    return res.data.workflows;
  }
  return [];
}

export const asyncTriggerPublish = async (workflowId, params) => {
  const res = await axios.post(
    `${workflowBaseUrl}/${workflowId}/dispatches`,
    params,
    {
      headers: {
        Accept: "application/vnd.github+json",
        Authorization
      }
    }
  )
  return res;
}

export const asyncListWorkflowRuns = async (workflowId) => {
  const res = await axios.get(
    `${workflowBaseUrl}/${workflowId}/runs`,
    {
      headers: {
        Accept: "application/vnd.github+json",
        Authorization,
      }
    }
  )
  return res;
}

export const asyncAutoPublishBlog = async(params: {
  cron: string;
  handler: string;
  handlerParam: string;
  name: string;
  notifyEmails?: string;
  status: boolean
}) => {
  const res = await axios.post(
    `/erupt-api/data/modify/EruptJob`,
    params,
    {
      headers: {
        token: (parent as any).getAppToken().token,
        erupt: 'EruptJob'
      },
    });

  if (res.status === 200) {
    return res.data;
  }
  return res;
}