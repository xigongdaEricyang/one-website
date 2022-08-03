import axios from 'axios';
import { curLanguage, Language } from '@/utils';

export const DEFAULT_PAGE_SIZE = 10;

const getEntity = (entity: string) => {
  return curLanguage === Language.ZH_CN ? entity : `${entity}EN`;
}

const getHost = () => {
  const { protocol, hostname } = location;
  if (hostname === 'localhost' || hostname === '127.0.0.1') {
    return 'http://192.168.8.116'
  }
  return `${protocol}://${hostname}`;
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
    `${getHost()}/website/blog/list`,
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
    `${getHost()}/website/blog/list`,
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