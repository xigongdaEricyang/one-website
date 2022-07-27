import axios from 'axios';
import { curLanguage, Language } from '@/utils';

export const DEFAULT_PAGE_SIZE = 10;

const entity = curLanguage === Language.ZH_CN ? 'Blog' : 'BlogEN';

export const asyncCreateBlog = async (data) => {
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
  const res = await axios.post(
    `/erupt-api/data/table/${entity}`,
    {
      pageIndex,
      pageSize: DEFAULT_PAGE_SIZE,
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

export const asyncDeleteBlogById = async (id: number) => {
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